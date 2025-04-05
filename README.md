# Anomaly CPU Affinity Fix Launcher

## English
There is a randomly occurring bug in STALKER Anomaly that causes the game to crash to desktop abruptly. This can be fixed by setting the game's CPU affinity to all available cores except the first one through the Windows Task Manager.

While this process is simple, it is easy to forget (often only realizing it when the crash happens), and repeating it multiple times can be quite annoying. A Mod Organizer 2 [addon](https://www.moddb.com/mods/stalker-anomaly/addons/automatic-anomalycpuaffinity) already exists to handle this,however, those who do not use Mod Organizer do not yet have this automation.

For this reason, I developed this launcher. Built with Python 3.12, it runs the original Anomaly launcher (or any other mod based on Anomaly, such as Gamma or EFP) and waits for any game executable to be detected. When this happens, the script automatically sets the game's CPU affinity to all available cores except the first physical core and the first logical core, preventing potential crashes.

---

#### Attention:
This program does not replace the Anomaly launcher or Mod Organizer; it is a tool designed to automate the process of setting the game's CPU affinity to the correct cores. With this tool, you can, for example, create shortcuts for the game that automatically set its affinity to specific cores selected manually by the user. Alternatively, if run normally without any arguments, the game will launch with affinity set to all cores except the first physical/logical one.

---

### Installation:
If you're using the original STALKER Anomaly or any mod that does not alter its file structure, simply extract the `CPUFixAnomalyLauncher.bat` file and the `CPUFixAnomalyLauncher` directory into the game's directory (same directory as `AnomalyLauncher.exe`) and launch the game using the `CPUFixAnomalyLauncher.bat` file.

Previously, I used PyInstaller to generate an executable file, which eliminated the need for the batch file, the Python script directory, and the interpreter. However, there were issues with antivirus false positives. Since I don’t plan to pay for a certificate just for a mod launcher, I decided to use open files and call the script via a batch file instead.

### Usage:
Just run the launcher. A command prompt window will appear, displaying game information while waiting for the Anomaly executable to start. Once the game is launched, after a few seconds, this command window will close automatically, as it is no longer needed. At this point, the game's affinity for the first physical and first logical cores will be disabled.

### Advanced Usage:
If adjustments are needed due to mods or if you want to launch Anomaly through Mod Organizer, advanced users can use command-line arguments to replace the game's original launcher (or even skip using any launcher at all. In this case, the script will simply wait to detect the game process). Additionally, users can exclude more CPU cores from the game beyond the first one or enable a debug mode that displays real-time CPU usage by the game updates every 5 seconds.

For more details on available command-line arguments, simply run: `CPUFixAnomalyLauncher.exe --help`:

```
usage: CPUFixAnomalyLauncher.bat [-h] [-m MIN_PHYSICAL_CORES] [-c CORE_MAP [CORE_MAP ...]] [-l LAUNCHER] [-d]

Executes Anomaly Launcher and removes the CPU affinity of N first cores from the game when it launches.

options:
  -h, --help            show this help message and exit
  -m MIN_PHYSICAL_CORES, --min-free-cpu-cores MIN_PHYSICAL_CORES
                        Sets the minimum amount of CPU physical cores reserved to system. (default: 1)
  -c CORE_MAP [CORE_MAP ...], --core-map CORE_MAP [CORE_MAP ...]
                        Manually sets the cores used to run Anomaly. If passed disables the automatic core selection.
                        (example: passing -c 1 2 3 grants to game to use cores 1, 2 and 3)
  -l LAUNCHER, --launcher LAUNCHER
                        Set the ANOMALY launcher file. If passed None as launcher, do not execute the game launcher and
                        just waits the game process. (default: AnomalyLauncher.exe)
  -d, --debug           Print game process details in real-time and keep console window open after game process termination.
```

### Compatibility:
In direct execution mode, without any arguments passed, the program looks for the `AnomalyLauncher.exe` file in the same directory. This file can be any launcher, including unofficial ones.

When running, the program searches for one of the following executable files to adjust CPU affinity:

- `AnomalyDX11AVX.exe`
- `AnomalyDX11.exe`
- `AnomalyDX10AVX.exe`
- `AnomalyDX10.exe`
- `AnomalyDX9AVX.exe`
- `AnomalyDX9.exe`
- `AnomalyDX8AVX.exe`
- `AnomalyDX8.exe`

These are the game's standard executable names. Regardless of modifications to the executables, the mod being played, or the file locations, if the game's executable matches one of these names, it will be recognized normally. Since many mods modify the game executables, the most general way to detect the running game is by checking the file name.

### Source Code and Compilation:
[GitHub repository](https://github.com/renard162/Anomaly_CPU_Fix_Launcher)

Dependencies:
- [Python 3.12](https://www.python.org)
- [Psutil 7.0](https://pypi.org/project/psutil/)
- [PyInstaller 6.12](https://pypi.org/project/pyinstaller/)


## Português
Existe um bug que ocorre de forma aleatória no STALKER Anomaly causando o fechamento abrupto do jogo que pode ser corrigido setando-se a afinidade do jogo por todas as CPUs disponíveis exceto a primeira pelo gerenciador de tarefas do Windows.

Esse processo é fácil de ser feito mas é fácil de se esquecer (descobrindo-se apenas quando o bug acontece) e pode ser bastante irritante de se repetir diversas vezes. Um [addon](https://www.moddb.com/mods/stalker-anomaly/addons/automatic-anomalycpuaffinity) para o Mod Organizer 2 já existe, porém, aqueles que não utilizam o Mod Organizer ainda não possuíam esta automação.

Por este motivo desewnvolvi este launcher, desenvolvido em Python 3.12, ele carrega o launcher original do Anomaly (ou qualquer outro mod que utilize o anomaly de base, como o Gamma ou o EFP) e espera que algum executável do jogo seja decetado. Quando isto ocorre, o script seta automaticamente a afiniade do jogo para todos os núcleos disponíveis no PC exceto o primeiro físico e o primeiro núcleo lógico, prevenindo assim os eventuais crashes.

---

#### Atenção:
Este programa não substitui o launcher do Anomaly nem o Mod Organizer, se trata de uma ferramenta para automatizar o processo de configurar a afinidade do jogo aos núcleos corretos. Com esta ferramenta pode-se, por exemplo, criar atalhos para o jogo que automaticamente configuram a afinidade do mesmo a determinados núcleos selecionados manualmente pelo usuário ou, rodando normalmente, sem nenhum argumento, executar o jogo com a afinidade com todos os núcleos, exceto o primeiro físico/lógico.

---

### Instalação:
Caso esteja usando o STALKER Anomaly original ou qualquer mod que não altere sua estrutura de arquivos, basta extrair o arquivo `CPUFixAnomalyLauncher.bat` e o diretório `CPUFixAnomalyLauncher` no mesmo diretório do jogo (mesmo diretório do arquivo `AnomalyLauncher.exe`) e carregar o jogo por meio do arquivo `CPUFixAnomalyLauncher.bat`.

Inicialmente eu havia utilizado o PyInstaller para gerar um arquivo executável, o que dispensava o uso do arquivo bat, do diretório contendo o script python e o interpretador, mas houveram problemas de falsos positivos de antivirus. Como não pretendo pagar por um certificado apenas para um launcher de um mod, então decidi por utilizar os arquivos abertos e chamar o script por meio de um arquivo bat.

### Utilização:
Basta executar o launcher, uma janela de prompt será exibida com as informações do jogo aguardando o executável do Anomaly. Assim que o jogo for aberto, após alguns segundos, essa janela de comando se fechará automaticamente já que não existe mais utilidade para ela e a afinidade do jogo pelo primeiro núcleo físico e primeiro núcleo lógico estará desabilitado.

### Uso avançado:
Caso sejam necessários ajustes por conta de mods ou mesmo para executar o Anomaly pelo Mod Organizer, usuários mais avançados podem utilizar os argumentos de chamada do loader para trocar o launcher original do jogo (ou mesmo não utilizar nenhum launcher, nesse caso o script só fica esperando encontrar o processo do jogo), podem também setar mais núcleos retirados do jogo além do primeiro ou mesmo podem acessar uma tela de debug que mostra em tempo real (com atualização a cada 5 segundos) a utilização de CPU pelo jogo.

Para maiores informações a respeito dos argumentos de execução, basta executar o comando `CPUFixAnomalyLauncher.exe --help`:

```
uso: CPUFixAnomalyLauncher.bat [-h] [-m MIN_PHYSICAL_CORES] [-c CORE_MAP [CORE_MAP ...]] [-l LAUNCHER] [-d]

Executa o AnomalyLauncher e remove a afinidade de CPU do jogo pelos N primeiros cores quando o jogo inicia.

Opções:
  -h, --help            Exibe esta mensagem e finaliza o script.
  -m MIN_PHYSICAL_CORES, --min-free-cpu-cores MIN_PHYSICAL_CORES
                        Seta a quantidade mínima de núcleos físicos reservados para o sistema. (Padrão: 1)
  -c CORE_MAP [CORE_MAP ...], --core-map CORE_MAP [CORE_MAP ...]
                        Seta manualmente os núcleos que serão utilizados pelo jogo. Se este argumento for
                        fornecido, a seleção automática de núcleos é desabilitada.
                        (exemplo: passando o argumento -c 1 2 3 permite ao jogo utilizar os núcleos 1, 2 e 3)
  -l LAUNCHER, --launcher LAUNCHER
                        Seta o arquivo do launcher do ANOMALY. Se fornecido o valor None como launcher, nada
                        será executado e o script aguardará que um processo do Anomaly seja criado.
                        (Padrão: AnomalyLauncher.exe)
  -d, --debug           Exibe os detalhes de execução do jogo em tempo real e mantém a janela do launcher aberta
                        após a finalização do processo dojogo.
```

### Compatibilidade:
No modo de execução direta, sem nenhum argumento passado, o programa procura pelo arquivo `AnomalyLauncher.exe` no mesmo diretório. Este programa pode ser qualquer launcher, mesmo os não oficiais.

Quando executado, o programa procura por um dos seguintes arquivos sendo executados para alterar a afinidade com os núcleos:

- `AnomalyDX11AVX.exe`
- `AnomalyDX11.exe`
- `AnomalyDX10AVX.exe`
- `AnomalyDX10.exe`
- `AnomalyDX9AVX.exe`
- `AnomalyDX9.exe`
- `AnomalyDX8AVX.exe`
- `AnomalyDX8.exe`

Estes arquivos são os executáveis do jogo com seu nome padrão. Independente de quais modificações nos executáveis, mod esteja sendo jogado ou local desses arquivos, se o executável do jogo possuir um desses nomes, será reconhecido normalmente. Como existem muitos mods que alteram os executáveis do jogo, então a forma mais geral de se detectar o jogo rodando foi procurando pelo nome do arquivo.

### Código fonte e compilação:
[Repositório do GitHub](https://github.com/renard162/Anomaly_CPU_Fix_Launcher)

Dependências:
- [Python 3.12](https://www.python.org)
- [Psutil 7.0](https://pypi.org/project/psutil/)
- [PyInstaller 6.12](https://pypi.org/project/pyinstaller/)
