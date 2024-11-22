# PopOS-Mod
This script will automate the install of all the drivers fonts and programs I use on my Daily Driver/Gaming rig/Tablets, this is for PopOS.


#### *** These scrips must be ran in order. Any deviation will break your system. The "3.sh" "Surface.sh" and "testing.sh" scripts are hardware based/optional. ***

- "1.sh" to update and install essentials to configure.

- "2.sh" will install applications, fonts, and cursors (it takes several minutes to run).

- "3.sh" installs the last few Gnome extensions and modify's them. Pop doesnt always like to cooperate. Do not run this script as sudo and you may have to manually install a few extensions on the list.

- "Surface.sh" will install the necessary drivers to get a Microsoft Surface running on PopOS (Also Debian and Ubuntu have been tested with this same script...skip if not a Surface).

- "popOS-i3wm.sh" will install I3 Window manager and necessary dependancies. 

- If you have multiple hard drives in your system, after you run all the scripts, edit your fstab to auto-mount your drives on boot.

### Credits:
- The surface bits are from: https://github.com/linux-surface/linux-surface/wiki but compiled into this script by me.

 
### To install:

1. Boot into your new install of PopOS and login with the user name and password you just created. Then:

``` sudo apt install git -y ```


3. After Git installs:

``` git clone https://github.com/PiercingXX/PopOS-Mod ```


4. Change Mod:

``` sudo chmod -R u+x PopOS-Mod/ ```


5. cd into install folder:

``` cd PopOS-Mod ```


6. Run the first script:

``` sudo su ```

``` ./1.sh ```


7. After the system reboots open Terminal (not kitty):

``` cd PopOS-Mod ```

``` sudo su ```

``` ./2.sh ```


8. If you are using a Microsoft Surface device you can now run the script:

``` ./Surface.sh ```




If you come across any issues please let me know!
