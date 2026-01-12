WDIR = .

OBJ = null

generate:
	@sbt "runMain $(OBJ)"

test-only:
	@sbt "testOnly $(OBJ)"

test-wave:
	@WAVEGEN=true sbt "testOnly $(OBJ)"

test-all:
	@sbt test

clean:
	@sbt clean
	@rm -rf ./generated
