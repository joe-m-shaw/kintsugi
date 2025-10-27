test_that("collect_ids_by_vector works for SeraSeq control", {
  
  x <- collect_ids_by_vector(query_vector = c("24039973"),
                      query_col = "labno")
  
  expect_equal(dim(x), c(1, 7))
  
})
