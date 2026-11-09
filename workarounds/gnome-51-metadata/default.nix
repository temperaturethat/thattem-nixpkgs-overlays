# Temporary GNOME 51 declarations; remove when upstream releases include support.
# Top Bar Organizer: https://gitlab.gnome.org/june/top-bar-organizer/-/merge_requests/5
# Transparent Window Moving: https://github.com/Noobsai/transparent-window-moving/issues/30

final: prev:

{

  gnomeExtensions = prev.gnomeExtensions // {

    top-bar-organizer = prev.gnomeExtensions.top-bar-organizer.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [ ./gnome-51.patch ];
    });

    transparent-window-moving = prev.gnomeExtensions.transparent-window-moving.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [ ./gnome-51.patch ];
    });

  };

}
