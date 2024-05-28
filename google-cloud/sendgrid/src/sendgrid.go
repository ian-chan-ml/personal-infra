package sendgrid

import (
	"encoding/json"
	"io"
	"log"
	"net/http"
	"os"

	"github.com/GoogleCloudPlatform/functions-framework-go/functions"
	"github.com/sendgrid/sendgrid-go"
	"github.com/sendgrid/sendgrid-go/helpers/mail"
)

type RequestData struct {
	ProjectID        string `json:"project_id"`
	FromAddress      string `json:"from_address"`
	ToAddress        string `json:"to_address"`
	Subject          string `json:"subject"`
	PlainTextContent string `json:"plain_text_content"`
}

func sendgridHTTP(w http.ResponseWriter, r *http.Request) {
	var requestData RequestData
	body, err := io.ReadAll(r.Body)
	if err != nil {
		http.Error(w, "Unable to read request body", http.StatusBadRequest)
		return
	}

	err = json.Unmarshal(body, &requestData)
	if err != nil {
		http.Error(w, "Invalid JSON", http.StatusBadRequest)
		return
	}

	if requestData.FromAddress == "" {
		http.Error(w, "from_address not found in request json or arguments", http.StatusBadRequest)
		return
	}

	if requestData.ToAddress == "" {
		http.Error(w, "to_address not found in request json or arguments", http.StatusBadRequest)
		return
	}

	if requestData.Subject == "" {
		http.Error(w, "subject of mail not found in request json or arguments", http.StatusBadRequest)
		return
	}

	sendgridAPIKey := os.Getenv("SENDGRID_API_KEY")

	// Send email using SendGrid
	from := mail.NewEmail("", requestData.FromAddress)
	to := mail.NewEmail("", requestData.ToAddress)
	message := mail.NewSingleEmail(from, requestData.Subject, to, requestData.PlainTextContent, "")

	sgClient := sendgrid.NewSendClient(sendgridAPIKey)
	response, err := sgClient.Send(message)
	if err != nil {
		log.Printf("failed to send email: %v", err)
		http.Error(w, "failed to send email", http.StatusInternalServerError)
		return
	}

	w.WriteHeader(response.StatusCode)
	w.Write([]byte(response.Body))
}

func init() {
	functions.HTTP("", sendgridHTTP)
}
