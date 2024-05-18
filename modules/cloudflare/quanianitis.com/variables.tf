variable "zone_name" {
  type = string
}

variable "a_records" {
  default = []
}

variable "aaaa_records" {
  default = []
}

variable "cname_records" {
  default = []
}

variable "ns_records" {
  default = []
}

variable "mx_records" {
  default = []
}

variable "txt_records" {
  default = []
}
