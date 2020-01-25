<pre align="center"><h3>Vasanth Developer's Hackintosh Project For 2018</h3><p>📖 Manuals, 🛠 configurations and 🏎️ drivers specific to my hackintosh 2018 build.</p></pre>

> _**Disclaimer:** All the guides, links, `kexts` and configurations are specific to my hardware. Following this repository for 
any other hardware is discouraged._

## 🍀 Clover
_**Note:** As ethernet driver injection is not working in newer versions of Clover bootloader, the tested and preferred version is v5070._

<a href="https://sourceforge.net/projects/cloverefiboot/files/Bootable_ISO" target="_blank" rel="noopener">Clover Download</a><br>
<a href="https://mackie100projects.altervista.org/download-clover-configurator" target="_blank" rel="noopener">Clover Configurator</a>

#### 🚓 EFI Drivers
<table>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Download</th>
    </tr>
    <tr>
        <td>APFSDriverLoader</td>
        <td>UEFI driver to allow Clover to detect APFS volues.</td>
        <td><a href="https://github.com/acidanthera/applesupportpkg/releases"><strong>Download</strong></a></td>
    </tr>
    <tr>
        <td>AptioMemoryFix</td>
        <td>Fixes memory allocation when booted through UEFI.</td>
        <td><a href="https://github.com/acidanthera/AptioFixPkg/releases"><strong>Download</strong></a></td>
    </tr>
    <tr>
        <td>HFSPlus</td>
        <td>Official Apple driver for reading HFS+ volumes in UEFI.</td>
        <td><a href="https://raw.githubusercontent.com/JrCs/CloverGrowerPro/master/Files/HFSPlus/X64/HFSPlus.efi"><strong>Download</strong></a></td>
    </tr>
</table>


## 🔌 Kernel Extensions
<table>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Download</th>
    </tr>
    <tr>
        <td>AppleALC</td>
        <td>Universal audio driver to get audio working.</td>
        <td><a href="https://github.com/acidanthera/applealc/releases"><strong>Download</strong></a></td>
    </tr>
    <tr>
        <td>IntelMausiEthernet</td>
        <td>Ethernet driver for newer Intel cards to get internet connection.</td>
        <td><a href="https://bitbucket.org/RehabMan/os-x-intel-network/downloads"><strong>Download</strong></a></td>
    </tr>
    <tr>
        <td>Lilu</td>
        <td>Kernel extension that helps in injecting other kernel extensions.</td>
        <td><a href="https://github.com/acidanthera/lilu/releases"><strong>Download</strong></a></td>
    </tr>
    <tr>
        <td>USBMap</td>
        <td>Injects the USB ports specific to motherboard, and fixes USB power issues.</td>
        <td><a><strong>Download</strong></a></td>
    </tr>
    <tr>
        <td>VirtualSMC</td>
        <td>Kernel device emulator for <i>System Management Controller</i>.</td>
        <td><a href="https://github.com/acidanthera/VirtualSMC/releases"><strong>Download</strong></a></td>
    </tr>
    <tr>
        <td>WhateverGreen</td>
        <td>Fixes/provides graphics acceleration for Intel integrated graphics chips.</td>
        <td><a href="https://github.com/acidanthera/whatevergreen/releases"><strong>Download</strong></a></td>
    </tr>
</table>

## 🔨 Installing `USBMap.kext`
_**Note:** This kernel extension and DSDT patches will only for for the hardware prescribed [here](#). Other than the exact same hardware, using it anywhere else will **NOT** work!_

_**Note:** The below commands should be executed relative to the root of your EFI partition._
1. Create the necessary directory structure.
```
mkdir -p {EFI/CLOVER/ACPI/patched,EFI/CLOVER/ACPI/origin,EFI/CLOVER/ACPI/WINDOWS}
```
2. Copy the `USBMap.kext` from this repository to `EFI/CLOVER/kexts/Other`.
3. Copy both the `SSDT-USBX.aml` and `SSDT-USBX.dsl` to `EFI/CLOVER/ACPI/patched`.

As I didn't have a USB Type-C device to map that USB port, I didn't. Another point to be noted is that the first two USB 3.0s on the motherboard could not be mapped as they were not detected by the [USBMap](https://github.com/corpnewt/USBMap) script. If you have mapped the leftover USB 3.0s as well as the Type-C port, please contribute (pull request) this repository, so it will be useful for anyone else 😃.

<br>

> [vasanth.tech](https://vasanth.tech) &nbsp;&middot;&nbsp;
> YouTube [@vasanthdeveloper](https://vasanth.tech/youtube) &nbsp;&middot;&nbsp;
> Twitter [@vasanthdevelope](https://vasanth.tech/twitter) &nbsp;&middot;&nbsp;
> Discord [Vasanth Developer](https://vasanth.tech/discord)