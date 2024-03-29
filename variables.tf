variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "sns-email" {
  default     =  "miguelromeroruiz@outlook.com"
  description =  "This is the email where sns is activated"
  type        =  string
}
