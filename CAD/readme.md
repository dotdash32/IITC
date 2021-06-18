# CAD

The CAD models of the project!

Files are organized by subassembly.
The computer these were designed on is 6 years old and can't handle very large files, so most things are split up for ease of use and modeling.
Each folder contains approximately one assembly with the structure:

```
+-- Assembly_Name_1
|   +-- 0Assembly_Name_1.f3d
|   +-- STL_File1.stl
|   +-- STL_File2.stl
|   +-- readme.md
+ -- Assembly_Name_2
|   +-- ....
+ -- Tools
|   +-- Tool_Name_1
|   |  +-- 0Tool_Name_1.f3d
|   |   +-- STL_File1.stl
|   |   +-- STL_File2.stl
|   |   +-- readme.md
|   +-- Tool_Name_2
|   |   +--...
```

Each folder contains the Fusion archive that was used to make it, so some of these files are `.f3z`, Fusion's interdependent format since they contain derived parts.
Each STL is labelled, but they might not have 1-1 correspondence with Component names.
Instead, there should be nearly 1-1 correspondence on Body names, which is easier for export and managing.

WARNING: Body renaming is still in progress, so it might not be perfect.  If it's unclear, please submit an issue!

Each folder readme should include the needed materials, which will also be compiled in a general spreadsheet to easily build BOMs.  This is a work in progress (yikes), and should also include assembly instructions soon.