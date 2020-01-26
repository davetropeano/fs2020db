provider "ibm" {    
    region = "us-east"
}

terraform {
  required_version = ">= 0.11"
}

resource "ibm_function_action" "hellojs" {
  name = "wdc-namespace/pyhello"

  exec {
    kind = "nodejs"
    code = "${file("hello.js")}"
  }
}

output "function_action" {
    value = "${ibm_function_action.hellojs.exec}"
}