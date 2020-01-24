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
        <td>USBInjectAll</td>
        <td>Should be replaced with <code>USBMap.kext</code>.</td>
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

## ✅ Todo:
1. Replace `AptioMemoryFix` with `OsXAptioFix3Drv` which is newer and is in-development.

<br>

> [vasanth.tech](https://vasanth.tech) &nbsp;&middot;&nbsp;
> YouTube [@vasanthdeveloper](https://vasanth.tech/youtube) &nbsp;&middot;&nbsp;
> Twitter [@vasanthdevelope](https://vasanth.tech/twitter) &nbsp;&middot;&nbsp;
> Discord [Vasanth Developer](https://vasanth.tech/discord)