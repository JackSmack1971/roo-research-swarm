#!/usr/bin/env python3
import pathlib, sys
root = pathlib.Path(sys.argv[1] if len(sys.argv)>1 else ".")
def tree(p: pathlib.Path, prefix=""):
    entries = sorted(p.iterdir(), key=lambda x: (not x.is_dir(), x.name.lower()))
    for i, e in enumerate(entries):
        connector = "└── " if i == len(entries)-1 else "├── "
        print(prefix + connector + e.name + ("/" if e.is_dir() else ""))
        if e.is_dir():
            tree(e, prefix + ("    " if i==len(entries)-1 else "│   "))
print(root.resolve().name + "/")
tree(root)
