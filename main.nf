#!/usr/bin/env nextflow

process sayHello {
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'

    aws s3 ls $x

    """
}

workflow {
  Channel.of(
    's3://ob-warehouse-raw-us-west-2-377686866371',
    's3://ob-warehouse-prod-us-west-2-377686866371', 
    's3://ob-warehouse-inflight-us-west-2-377686866371',
    's3://ob-warehouse-archive-us-west-2-377686866371',
    's3://ob-tower-bucket-us-west-2-377686866371',
    's3://ob-proteomics-analysis-us-west-2-377686866371',
    's3://ob-warehouse-test-us-west-2-377686866371') | sayHello | view
}
