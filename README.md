# This repository contains a very simple first-step tutorial on how to perform bioinformatic analyses on our phyloserver.

-   The slides to this Workshop can be found [here](https://github.com/nhmvienna/FirstSteps/blob/main/resources/Workshop_Phyloserver2.pdf) (admission to NHM private repositories necessary)
-   The recordings of the Workshop can be found on the NHM intranet under `I:/Public/mkapun/FrontiersInMolecularSystematics/Workshop_I_Phyloserver`

### (a) Access via Remote Desktop

On your Windows computer, search for the "Remote Desktop" tool (see below)

![RemoteDesktop](.bckup/Images/Workshop/RD.png)

enter the IP address for the phyloserver and use the username and password provided during the workshop. On the GNOME Desktop of the Server you can click on the "Aktivitäten" field to choose different installed programs, e.g. Terminal.

![AlmaLinuxTerminal](.bckup/Images/AlmaLinuxTerminal.png)

### (b) set up VSCode Text Editor

To start the VSCode Editor, simply type `code` in the Terminal

![RemoteDesktop](.bckup/Images/VSCode/code.png)

and the following window will appear

![RemoteDesktop](.bckup/Images/VSCode/VSC_start.png)

On the startup screen you will find a Welcome Guide, which is very useful for the initial setup of VSCode.

For example, there are several options to adjust the appearance of the editor's window. VSCode editor is famous for its ability to be tailored to user's requirement. For example, you can easily change the theme of VSCode by choosing `File -> Preferences -> Settings`, or more simply, by clicking `Ctrl+,`.

![(themes)](.bckup/Images/VSCode/VSC_theme.png)
### Set up shortcut to automatically copy and excecute code from a text file in the terminal using the combination of the keys `'ctrl'+'enter'`

You need to open the Keymap file by clicking ``Ctrl+Shift+p``. Then type "Key" and choose "Preferences: Open Keyboard Shortcuts"

![(keymap)](.bckup/Images/VSCode/Shortcuts.png)

In the new window, type "runse" and choose "Terminal: Run Selected Text in Active Terminal". If no keybinding exist you, can click in the empty field left to the Commnad column and a new window will appear, where you can use your desired Keycombination to execute. I use, for example "Ctrl+Enter".

![(keymap)](.bckup/Images/VSCode/RunSel.png)

### (c) clone this GitHub repository

In your VSCode editor, open a new terminal window by the "Terminal"  tab in the menu bar at the top. 

![(keymap)](.bckup/Images/VSCode/NewTerminal.png)

and paste the below code in the terminal window

```bash
cd

git clone https://github.com/nhmvienna/Workshop_I_Intro_to_Phyloserver
```

Now, you have imported all data from the 'Workshop_I_Intro_to_Phyloserver' repository to your home directory.

### (d) Select project folders

By clicking `File > Add Project folder...`  you can now select the newly downloaded folder "Workshop_I_Intro_to_Phyloserver" from your home directory as your project folder.

![(PF1)](.bckup/Images/VSCode/ProjectFolder1.png)

Once the Project folder is loaded, it will appear in the left pane of the window.

![(PF3)](.bckup/Images/VSCode/Sidebar.png)

### (e) Start the bioinformatic analyses

In VSCode, open the document 'main.sh' located in the folder shell/ and follow the instructions.

You may need to adjust the wrapping of the text to improve the readibility. This can be done by clicking `View -> Word Wrap` in the menu bar

![(PF3)](.bckup\Images\VSCode\WordWrap.png)

### (f) Moving files from the server to your Windows computer

If you want to migrate files from your personal computer to the server, you can use the `scp` command in the powershell of your Windows computer. You will need to know the path to the destination on the server where you want to copy your files from.

Note that the adress of the server address must contain (1) the username followed by an `@` symbol, (2) the name or IP address of the remote machine, followed by a colon `:` and (3) the full path to the file that should be copied.

```bash
# copy the file TestFileToMoveAround.txt from the Desktop of the remote machine to the H:/ drive on your Windows machine
scp <username>@<IP>:~/Desktop/TestFileToMoveAround.txt H:/
```

Alternatively you can also use [WinSCP](https://github.com/nhmvienna/FirstSteps/blob/main/Bioinformatics/Phyloserver.md#2-via-winscp)

:warning:Be warned, we will now dive deep into cryptozoology ;-) :warning:

## Happy exploring
