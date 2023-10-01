# Mord3rca's Personal portage tree

Just a collection of ebuild I need.

## Installation

### Manual

  * Clone the repository and make it readable by `portage` user

  * Create `/etc/portage/repos.d/mord3rca.conf` with the following content:
```
[mord3rca]
location = /path/to/cloned/repo
```

### Eselect

  * Install [app-eselect/eselect-repository](https://packages.gentoo.org/packages/app-eselect/eselect-repository)

  * Use `eselect repository add mord3rca git https://github.com/Mord3rca/portage-tree.git`
