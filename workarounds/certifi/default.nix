# Workaround: update certifi to satisfy honcho-ai 2.8.0's runtime requirement.

final: prev:

{

  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (python-final: python-prev: {

      certifi = python-prev.certifi.overridePythonAttrs (old: {
        version = "2026.10.23";

        # The upstream source tag already follows finalAttrs.version.
        src = old.src.overrideAttrs {
          hash = "sha256-uESJgC07To+bUePmwi180SCtAzAZkmEn1UolTWpB4X0=";
        };
      });

    })
  ];

}
