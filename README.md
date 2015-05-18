Victron Energy changes / appends to other layers.

This layer appends to other layers or provides complete recipes which
other layers also provide (but we don't use). It is a different layer
since this might collide with other layers or fail if the recipes for
the bbappend themselves are not available.

In short, bbappends and possible conflicting packages should be here.
Packages which are provided by Victron Energy should be in the
meta-victronenergy layer.
