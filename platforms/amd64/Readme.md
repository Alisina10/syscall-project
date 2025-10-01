COM-341, Operating Systems
==========================
# Project #1, Part #1, GNU/Linux on AMD64

## Getting Access to a GNU/Linux Machine

First, create an isolated x86-64 GNU/Linux environment using the QEMU virtualization and emulation system. It is preferable to run QEMU as virtualization software if you have an x86-64 host environment, or as an emulator otherwise.

If you have an x86-64 CPU and virtualization technologies are enabled in your firmware settings (BIOS, UEFI), modify the following files in `platforms/amd64`:

* `start.sh`
* `start_installation.sh`

In each file, replace the word `tcg` on line 17 or 23 with:

* `whpx,kernel-irqchip=off` if you are on Windows 10+ with Hyper-V [enabled](https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v)
* `hvf` if you are on macOS 15.6+
* `kvm` if you are on GNU/Linux and have the `qemu-kvm` package installed

If you cannot enable virtualization on your computer or are using lab machines, retain the `tcg` on line 17 or 23 in all the files. Note that QEMU will run as an emulator in this case, and the emulation process will be slower compared to virtualization. The steps below may consequently take more time.

Now, with or without virtualization, proceed with the steps below:

1. Navigate to the project directory.

2. Download the QEMU hardware emulator for your operating system.

        # On Windows (from the Bash shell bundled with Git)
        ./utilities/download_qemu_win64.sh

        # On macOS with [Homebrew](http://brew.sh)
        brew install qemu

        # On Ubuntu Linux
        sudo apt install curl qemu-system qemu-utils # Add `qemu-kvm` if virtualization is available

3. Change to the directory `./platforms/amd64`.

        cd 'platforms/amd64/'

4. Download the Debian installation disk.

        ./utilities/download_debian.sh

5. Download the UEFI image for QEMU.

        ./utilities/download_firmware.sh

6. Create a new hard drive image file to store the installed system.

        ./utilities/create_disk_image.sh

7. Launch the emulator and begin the installation process. It is advisable to use hardware virtualization for this step. Run the `start_installation.sh` script:

        ./start_installation.sh

8. Select the `Install` option (not the `Graphical Install` option if present) in the bootloader. Use `Arrow` keys or `Backspace` to navigate the screen. Follow the installation steps provided. It's recommended to close QEMU after the first successful reboot during the installation, and boot Debian for the first time using the `./start.sh` script.

![Step 1](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/01.png)
![Step 2](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/02.png)
![Step 3](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/03.png)
![Step 4](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/04.png)
![Step 5](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/05.png)
![Step 6](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/06.png)
![Step 7](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/07.png)
![Step 8](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/08.png)
![Step 9](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/09.png)
![Step 10](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/10.png)
![Step 11](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/11.png)
![Step 12](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/12.png)
![Step 13](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/13.png)
![Step 14](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/14.png)
![Step 15](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/15.png)
![Step 16](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/16.png)
![Step 17](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/17.png)
![Step 18](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/18.png)
![Step 19](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/19.png)
![Step 20](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/20.png)
![Step 21](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/21.png)
![Step 22](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/22.png)
![Step 23](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/23.png)
![Step 24](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/24.png)
![Step 25](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/25.png)

When prompted by the installer, reboot. Afterward, the installer will restart. Shut down QEMU, then boot Debian using the `./start.sh` script.

![Step 26](https://raw.githubusercontent.com/rachmiroff/images/refs/heads/main/auca/com-341/fall-2025/syscall-project/amd64/26.png)

## Starting and Stopping the System

To start the QEMU emulator and Debian when the system is not running, use the following command:

```bash
./start.sh
```

If you encounter difficulties starting the emulator on Windows, ensure the QEMU executable location is added to the `$PATH` environment variable.

```bash
echo $PATH

# If the QEMU directory is not listed, from `platforms/amd64/` execute
export PATH=$PATH:`cd ../../qemu; pwd`
```

To power off the system and exit QEMU:

```bash
# After logging in with the username and password specified during installation
sudo systemctl poweroff
```

## Installing Additional Software

1. Start the system and log in.

2. Install the GNU C compiler, GNU Make build system, GNU Debugger, and Git version control system. You may install additional software, such as a code editor, for your convenience.

        sudo apt-get update
        sudo apt-get install gcc make gdb git

3. Shut down the system.

## Fixing Networking Issues [Optional]

1. If you encounter connectivity issues in the emulated environment, consider disabling IPv6 support in the kernel.

        sudo nano /etc/default/grub

2. Append `ipv6.disable=1` to the `GRUB_CMDLINE_LINUX` variable and save the file.

3. Update the GRUB boot loader.

        sudo update-grub

4. Restart the system.

        sudo systemctl reboot

## Cleanup [Optional]

1. Compress the virtual hard drive image file to conserve space on your computer.

        ./utilities/compress_disk_image.sh

2. Remove the old uncompressed disk image.

        ./utilities/remove_old_files.sh
