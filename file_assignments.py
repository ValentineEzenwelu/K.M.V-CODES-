import pathlib

path2 = pathlib.Path.home()

my_folder = path2 / "my_folder"
my_folder.mkdir(exist_ok=True)
print(my_folder)  # To show the file path for my_folder(to guide for when to delete)....

file_paths = [  # Creating a list of file paths
    my_folder / "file1.txt",
    my_folder / "file2.txt",
    my_folder / "image1.png"
]
# YOU can decide to create a placeholder in order to delete the files(Create a variable)

for path in file_paths:  # (You use this method if you use lists)
    path.touch()

for file in my_folder.iterdir():
    print(file.name)

images = path2 / "my_folder" / "images"  # To create the image directory inside the my_folder directory
images.mkdir(exist_ok=True)  # To confirm its existence and to prevent an error on the second run

source = pathlib.Path(r"C:\Users\Admin\my_folder\image1.png")
destination = path2 / "my_folder" / "images" / "image1.png"  # You must specify the folder which houses the file in
source.replace(destination)  # To move the file to the required destination
print(source)
print(source.exists())

delete_file = my_folder / "file1.txt"
delete_file.unlink()  # To delete the file
# Before you delete the folder you must delete every file in the folder
delete_file2 = my_folder / "file2.txt"
delete_file2.unlink()
# So we shall delete every file from my_folder before proceeding to delete it
delete_file3 = my_folder / images / "image1.png"
delete_file3.unlink()
# Then we delete the images folder
delete_folder = my_folder / "images"
delete_folder.rmdir()
# Next we delete the main my_folder directory
my_folder.rmdir()

# my_folder.rmdir()
