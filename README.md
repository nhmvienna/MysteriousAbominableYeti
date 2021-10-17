## This repository contains a very simple first-step tutorial on how to perform bioinformatic analyses on our phyloserver.

:warning:Be warned, we will dive deep into cryptozoology ;-) :warning:

### (a) Access via Remote Desktop

On your Windows computer, search for the "Remote Desktop" tool (see below)

![RemoteDesktop](.bckup/Images/Workshop/RD.png)

enter the IP address for the phyloserver and use the username and password provided during the workshop. On the GNOME Desktop of the Server you can click on the "Aktivitäten" field to choose different installed programs, e.g. Terminal.

![AlmaLinuxTerminal](.bckup/Images/AlmaLinuxTerminal.png)

### (b) set up ATOM Text Editor

To start the Atom Editor, simply type `atom` in the Terminal

![RemoteDesktop](.bckup/Images/Workshop/Atom.png)

and the following window will appear

![RemoteDesktop](.bckup/Images/Workshop/Atom_blank.png)

There are several options to adjust the appearance of the editor's window. Atom editor is famous for its ability to be tailored to user's requirement. To do that, follow the given steps. Click on the 'Edit' button in the menu bar and navigate to 'preferences'

![(https://linuxhint.com/wp-content/uploads/2020/03/6-42.png)](https://linuxhint.com/wp-content/uploads/2020/03/6-42.png)

and you will see the following screen

![(https://linuxhint.com/wp-content/uploads/2020/03/7-42.png)](https://linuxhint.com/wp-content/uploads/2020/03/7-42.png)

There, you can select themes and choose the "light" theme both for the user interface (UI)...

![(themes)](.bckup/Images/Workshop/Atom_Themes.png)

and also for the code syntax field.

![(syntax)](.bckup/Images/Workshop/Atom_SyntaxThemes.png)

#### install Platformio-ide-terminal

As a very first step, we are going to install the ESSENTIAL `Platformio-ide-terminal` pacakge, which adds a fully functioning terminal to your ATOM editor.

Go to your terminal and type

```bash
apm install plattformio-ide-terminal
```

![(IDE-Terminal)](.bckup/Images/Workshop/Atom_Install1.png)

The next time you open ATOM, you will find a `+` in the bottom left corner of the window.

Once you click on it, a new terminal window will appear at the bottom of the Atom Window.

![(Terminal)](.bckup/Images/Workshop/Atom_terminal.png)

While this is already cool, you can set a shortcut to automatically copy and excecute code from a text file in the terminal using the combination of the keys `'ctrl'+'enter'`

You need to open the Keymap file by clicking 'Edit' and choosing Keymap...

![(keymap)](.bckup/Images/Workshop/Atom_keymap.png)

In the keymap.cson file, you need to add the following lines and save the file.

```bash
'atom-text-editor':
  'ctrl-enter': 'platformio-ide-terminal:insert-selected-text'
```

![(keymap)](.bckup/Images/Workshop/Atom_keymap_terminal.png)

Then you need to restart Atom so that the shortcut becomes available. Now that we have a fully functioning text editor, it is time to start some real analyses

### (c) clone this GitHub repository

In your Atom editor, open a new terminal window by clicking the `+` in the bottom left corner and type the following

```bash
cd

git clone https://github.com/nhmvienna/MysteriousAbominableYeti
```

Now, you have imported all data from the 'MysteriousAbominableYeti' repository to your home directory.

### (d) Select project folders

By clicking `File > Add Project folder...` or by using the shortcut **'Ctrl'+'Shift'+'A'** you can now select the newly downloaded folder "MysteriousAbominableYeti" as your project folder.

![(PF1)](.bckup/Images/Workshop/Atom_ProjectFolder.png)

![(PF2)](.bckup/Images/Workshop/Atom_ProjectFolder2.png)

Once the Project folder is loaded, it will appear in the left pane of the window.

![(PF3)](.bckup/Images/Workshop/Atom_ProjectFolder3.png)

### (e) Start the bioinformatic analyses

In Atom, open the document 'main.sh' located in the folder shell/ and follow the instructions.

You may need to adjust the wrapping of the text to improve the readibility. This can be done as follows

![(PF3)](.bckup/Images/Workshop/Atom_Softwrap.png)

## Happy exploring
