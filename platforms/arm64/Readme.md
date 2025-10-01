COM-341, Operating Systems
==========================
# Project #1, Part #1, Debian for ARM64 CPUs

## Installing Debian

First, create an isolated ARM64 GNU/Linux environment through the QEMU virtualization and emulation system. You should try your best to run QEMU as virtualization software if you have an ARM64 host environment (e.g., Apple M1, M2, M3, M4, ... machines). If not, run it as an emulator.

If you have an ARM64 CPU and virtualization technologies are enabled in your firmware (BIOS, UEFI) settings, edit the following files in `platforms/amd64`:

* `start.sh`
* `start_installation.sh`

In each file, replace the word `tcg` on line 17 or 23 with:

* `whpx` if you are on Windows 10+ and have Hyper-V [enabled](https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v)
* `hvf` if you are on macOS 15.6+
* `kvm` if you are on GNU/Linux and have the `qemu-kvm` package installed

If you cannot enable virtualization on your computer or are using lab machines, retain `tcg` on line 17 or 23 in all the mentioned files. Note that QEMU will run as an emulator in this case. Emulation is slower than virtualization, so the subsequent steps might take longer than expected.

Now, with or without virtualization, proceed with the following steps:

1. Navigate to the project directory.

2. Download the QEMU hardware emulator suitable for your operating system.

        # On Windows (from the Bash shell bundled with Git)
        ./utilities/download_qemu_win64.sh

        # On macOS with [Homebrew](http://brew.sh)
        brew install qemu

        # On Ubuntu Linux
        sudo apt install curl qemu-system qemu-utils # Add `qemu-kvm` if virtualization is available

3. Change to the directory `./platforms/arm64`.

        cd 'platforms/arm64/'

4. Download the Debian installation disk.

        ./utilities/download_debian.sh

5. Get the UEFI image for QEMU.

        ./utilities/download_firmware.sh

6. Create a new hard drive image file to house the installed system.

        ./utilities/create_disk_image.sh

7. Initiate the emulator/virtualizer and begin the installation process.

        ./start_installation.sh

8. In QEMU, switch to the serial console using `CTRL+ALT+2`. Choose the `Install` option in the bootloader using the `Arrow` keys or the `Backspace` key. Follow the on-screen instructions to complete the system installation. It's advisable to close QEMU after the first successful reboot during the installation and then boot Debian using the `./start.sh` script.

![Step 1](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/01.png)
![Step 2](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/02.png)
![Step 3](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/03.png)
![Step 4](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/04.png)
![Step 5](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/05.png)
![Step 6](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/06.png)
![Step 7](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/07.png)
![Step 8](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/08.png)
![Step 9](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/09.png)
![Step 10](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/10.png)
![Step 11](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/11.png)
![Step 12](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/12.png)
![Step 13](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/13.png)
![Step 14](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/14.png)
![Step 15](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/15.png)
![Step 16](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/16.png)
![Step 17](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/17.png)
![Step 18](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/18.png)
![Step 19](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/19.png)
![Step 20](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/20.png)
![Step 21](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/21.png)
![Step 22](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/22.png)
![Step 23](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/23.png)
![Step 24](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/24.png)
![Step 25](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/25.png)

When prompted by the installer, reboot. Afterward, the installer will restart. Shut down QEMU, then boot Debian using the `./start.sh` script.

![Step 26](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/arm64/26.png)

## Starting and Stopping the System

To start the QEMU emulator and Debian when the system is not already running, use:

```bash
./start.sh
```

If you face issues starting the emulator on Windows, ensure the QEMU executable's path is in the $PATH environment variable.

```bash
echo $PATH

# If the QEMU directory isn't listed in $PATH, from `platforms/arm64/`, execute:
export PATH=$PATH:`cd ../../qemu; pwd`
```

To power off the system and exit QEMU:

```bash
# Once you've started the system and logged in using the username and password set during installation:
sudo systemctl poweroff
```

## Installing Additional Software

1. Boot up the system and log in.
2. Install the GNU C compiler, the GNU Make build system, the GNU Debugger, and the Git version control system. You may install additional software, such as a code editor, for your convenience.

        sudo apt-get update
        sudo apt-get install gcc make gdb git

3. Power off the system.

## Fixing Networking Issues [Optional]

1. If you encounter connectivity problems within the emulated environment, consider disabling IPv6 support in the kernel.

        sudo nano /etc/default/grub

2. Add `ipv6.disable=1` to the `GRUB_CMDLINE_LINUX` variable and save the file.
3. Update the GRUB bootloader.

        sudo update-grub

4. Reboot the system.

        sudo systemctl reboot

## Cleanup [Optional]

1. Compress the hard drive image file.

        ./utilities/compress_disk_image.sh

2. Delete the old uncompressed disk image.

        ./utilities/remove_old_files.sh
