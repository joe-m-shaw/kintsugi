test_that("list_worksheet_filepaths works", {
  
  files<- list_worksheet_filepaths(worksheet = "WS157517", pattern = "hrd-results.*csv")
  
  expect_equal(length(files),
               7)
})
