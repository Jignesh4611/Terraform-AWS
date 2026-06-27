package kubernetes

deny contains msg if {
  endswith(input.image.tag, "latest")
  msg := "latest tag not allowed"
}