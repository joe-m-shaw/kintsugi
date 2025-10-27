test_that("collect_worksheets_by_vector gives expected output for description field", {
  
  x <- collect_worksheets_by_vector(query_col = "description",
                                     query_vector = c("PanSolid CNV validation CDKN2A"),
                                     output_cols = c("pcrid", 
                                                     "description"))
  expect_equal(dim(x), c(1, 3))
  
})

test_that("collect_worksheets_by_vector returns warning with empty input", {
  
  expect_warning(collect_worksheets_by_vector(query_col = "description",
                                     query_vector = c("")))
  
})

test_that("collect_worksheets_by_vector works with numeric worksheet ID", {
  
  x <- collect_worksheets_by_vector(query_col = "pcrid",
                                     query_vector = c(146462))
  
  expect_equal(dim(x), c(1, 4))
  expect_equal(x$description, c("PanSolid CNV validation CDKN2A"))

})

test_that("collect_worksheets_by_vector gives error when query_col not in output_cols", {
  
  expect_error(collect_worksheets_by_vector(query_col = "pcrid",
                                     query_vector = c(146462),
                                     output_cols = c("description")))
})

test_that("collect_worksheets_by_vector works with descriptions function", {
  
  x <- collect_worksheets_by_vector(query_col = "description",
                                   query_vector = descriptions_pansolid(),
                                   output_cols = c("pcrid", 
                                                   "description"))
  expect_true(nrow(x) > 500)
  
})