baseDirectory:

packageList:

final: prev: {

  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (
      python-final: python-prev:
      prev.lib.genAttrs packageList (
        package: python-prev."${package}" or (python-final.callPackage (baseDirectory + "/${package}") { })
      )
    )
  ];

}
