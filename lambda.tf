resource "aws_lambda_function" "lambda_tf" {
  filename      = "lambda.zip"
  function_name = "lambda_handler"
  role          = aws_iam_role.lambda_role.arn
  #filename is lambda
  #function_name is lambda_handler
  handler       = "funcionalidad-lambda.lambda_handler"
  runtime       = "python2.7"


  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda.zip"))}"
  source_code_hash = filebase64sha256("lambda.zip")
  depends_on = ["aws_iam_role.lambda_role"]
}