baseDirectory:

packageList:

self: super: {

  pythonPackagesExtensions = super.pythonPackagesExtensions ++ [
    (
      python-self: python-super:
      super.lib.genAttrs packageList (
        package: python-super."${package}" or (python-self.callPackage (baseDirectory + "/${package}") { })
      )
    )
  ];

}
