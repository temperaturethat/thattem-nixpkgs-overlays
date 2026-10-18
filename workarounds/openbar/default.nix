# Workaround: GNOME 50 compatibility for openbar@neuromorph

final: prev:

{
  gnomeExtensions = prev.gnomeExtensions // {
    "open-bar" = prev.gnomeExtensions."open-bar".overrideAttrs (old: {
      patches = prev.lib.unique ((old.patches or [ ]) ++ [ ./gnome-50.patch ]);
    });
  };
}
