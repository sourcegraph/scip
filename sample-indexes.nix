{ pkgs }:
let
  gcsBaseUrl = "https://storage.googleapis.com/scip-indexes-benchmarking";
  fetchIndex =
    idx:
    "zstd -d ${
      pkgs.fetchurl {
        url = "${gcsBaseUrl}/${idx.name}.zst";
        hash = idx.hash;
      }
    } -o $out/${idx.name}";
  indexes = [
    {
      name = "django-1.scip";
      hash = "sha256-ztAsTTv6AOd6TP86xsDdNY5qdJitxHr59IVqYj3Bej4=";
    }
    {
      name = "flink-1.scip";
      hash = "sha256-+6523nt+0KjjP9b0HMnqrssiGU9c17PpfauOzT7PNT0=";
    }
    {
      name = "kubernetes-1.scip";
      hash = "sha256-179LC/Tc1+qWjODL5RDR2FIIf/e7dxQOjdQI7/89uFg=";
    }
    {
      name = "llvm-project-1.scip";
      hash = "sha256-vTetasSJumee9BVxXjBiIs13IQJml/pKc6r6SiOuuRc=";
    }
    {
      name = "materialize-1.scip";
      hash = "sha256-f3YRjnk2E8dC3hMOQQnn9se+shgoJard+6OR9Ze2Fio=";
    }
    {
      name = "postgres-1.scip";
      hash = "sha256-8bcnfdShjfDV2F4SMPlYANXStdwq8nOMWGPUoZmHN3g=";
    }
    {
      name = "rust-1.scip";
      hash = "sha256-M7eNYfiC5ZbSLAWkzwRb02YufPTrfLtkd6P120+sEes=";
    }
    {
      name = "shopify-api-ruby-1.scip";
      hash = "sha256-i1Kq0vQM40pYkA7ILTpYfc+n0asgjs/Npc+nSuLAmRo=";
    }
    {
      name = "typescript-1.scip";
      hash = "sha256-xUgceqFOXQbWe9+1uNcewqP2xavPvsLM87SygTtwbMQ=";
    }
  ];
in
pkgs.runCommand "scip-sample-indexes"
  {
    nativeBuildInputs = [ pkgs.zstd ];
  }
  ''
    mkdir -p $out
    cp ${./dev/sample_indexes/indexes-metadata.json} \
      $out/indexes-metadata.json
    ${pkgs.lib.concatMapStringsSep "\n" fetchIndex indexes}
  ''
