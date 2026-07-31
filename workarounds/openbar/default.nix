# Workaround: GNOME 50 compatibility for openbar@neuromorph
#
# Upstream metadata.json shell-version only goes up to "49".
# GNOME refuses to load extensions that don't list the current shell version.
# Apply a patch to add "50" until nixpkgs extensions.json catches up.
#
# The clearBtn scoping bug (issue #152) was already fixed upstream in v49,
# so only the metadata bump is needed.

self: super:

{
  gnomeExtensions = super.gnomeExtensions // {
    "open-bar" = super.gnomeExtensions."open-bar".overrideAttrs (old: {
      patches = (old.patches or []) ++ [ ./gnome-50.patch ];
    });
  };
}
