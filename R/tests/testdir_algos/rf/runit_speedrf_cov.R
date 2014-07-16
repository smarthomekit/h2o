setwd(normalizePath(dirname(R.utils::commandArgs(asValues=TRUE)$"f")))
source('../../findNSourceUtils.R')

test.speedrf.iris_class <- function(conn) {
  iris.hex <- h2o.uploadFile(conn, locate("smalldata/covtype/covtype.20k.data"))
  iris.rf  <- h2o.SpeeDRF(y = 55, x = 1:54, data = iris.hex, ntree = 50, depth = 100, local_mode = F)
  print(iris.rf)
  testEnd()
}

doTest("speedrf test iris all", test.speedrf.iris_class)
