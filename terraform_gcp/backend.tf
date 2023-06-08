terraform {
  backend "gcs" {
    bucket = var.bucket
    prefix = "terraform/state"
    credentials = "credentials_file.json"
  }
}
