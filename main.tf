provider "ibm" {    
    ibmcloud_api_key = "${var.ibmcloud_api_key}"
    region = "us-east"
    function_namespace="fs2020_dev"
}

variable "ibmcloud_api_key" {
  description = "your IBM Cloud API Key"
  default = ""
}

terraform {
  required_version = ">= 0.11"
}

resource "ibm_org" "fs2020_org" {
  name = "fs2020"
}
resource "ibm_space" "dev_space" {
  org = "fs2020"
  name = "dev"
}

resource "ibm_function_action" "hellojs" {
  name = "hellojs"

  exec {
    kind = "nodejs"
    code = "${file("hello.js")}"
  }
}

output "function_action" {
    value = "${ibm_function_action.hellojs.exec}"
}