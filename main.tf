provider "ibm" {    
    region = "us-east"
    function_namespace="fs2020_dev"
}

terraform {
  required_version = ">= 0.11"
}

resource "ibm_function_action" "hellojs" {
  name = "pyhello"

  exec {
    kind = "nodejs"
    code = "${file("hello.js")}"
  }
}

output "function_action" {
    value = "${ibm_function_action.hellojs.exec}"
}