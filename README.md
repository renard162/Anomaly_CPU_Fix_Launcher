# Anomaly CPU Affinity Fix Launcher

## English
There is a randomly occurring bug in STALKER Anomaly that causes the game to crash to desktop abruptly. This can be fixed by setting the game's CPU affinity to all available cores except the first one through the Windows Task Manager.

While this process is simple, it is easy to forget (often only realizing it when the crash happens), and repeating it multiple times can be quite annoying. A Mod Organizer 2 [addon](https://www.moddb.com/mods/stalker-anomaly/addons/mo2-plugin-anomaly-cpu-affinity) already exists to handle this, but it must be manually executed through the Mod Organizer every time the game is launched.

For this reason, I developed this launcher. Built with Python 3.12.8 and packaged as an executable using PyInstaller, it runs the original Anomaly launcher (or any other mod based on Anomaly, such as Gamma or EFP) and waits for any game executable to be detected. When this happens, the script automatically sets the game's CPU affinity to all available cores except the first physical core and the first logical core, preventing potential crashes.

### Installation:
If you're using the original STALKER Anomaly or any mod that does not alter its file structure, simply extract the `CPUFixAnomalyLauncher.exe` file into the game's directory (same directory of `AnomalyLauncher.exe`) and launch the game using this new launcher.

### Usage:
Just run the launcher. A command prompt window will appear, displaying game information while waiting for the Anomaly executable to start. Once the game is launched, after a few seconds, this command window will close automatically, as it is no longer needed. At this point, the game's affinity for the first physical and first logical cores will be disabled.

### Advanced Usage:
If adjustments are needed due to mods or if you want to launch Anomaly through Mod Organizer, advanced users can use command-line arguments to replace the game's original launcher (or even skip using any launcher at all. In this case, the script will simply wait to detect the game process). Additionally, users can exclude more CPU cores from the game beyond the first one or enable a debug mode that displays real-time CPU usage by the game updates every 5 seconds.

For more details on available command-line arguments, simply run: `CPUFixAnomalyLauncher.exe --help`.

### Source Code and Compilation:
[GitHub repository](https://github.com/renard162/Anomaly_CPU_Fix_Launcher)

Dependencies:
- [Python 3.12](https://www.python.org)
- [Psutil 7.0](https://pypi.org/project/psutil/)
- [PyInstaller 6.12](https://pypi.org/project/pyinstaller/)


## Português
Existe um bug que ocorre de forma aleatória no STALKER Anomaly causando o fechamento abrupto do jogo que pode ser corrigido setando-se a afinidade do jogo por todas as CPUs disponíveis exceto a primeira pelo gerenciador de tarefas do Windows.

Esse processo é fácil de ser feito mas é fácil de se esquecer (descobrindo-se apenas quando o bug acontece) e pode ser bastante irritante de se repetir diversas vezes. Um [addon](https://www.moddb.com/mods/stalker-anomaly/addons/mo2-plugin-anomaly-cpu-affinity) para o Mod Organizer 2 já existe, porém deve ser executado manualmente no Mod Organizer a cada execução do jogo.

Por este motivo desewnvolvi este launcher, desenvolvido em Python 3.12.8 e compactado em um executável por meio do PyInstaller, ele carrega o launcher original do Anomaly (ou qualquer outro mod que utilize o anomaly de base, como o Gamma ou o EFP) e espera que algum executável do jogo seja decetado. Quando isto ocorre, o script seta automaticamente a afiniade do jogo para todos os núcleos disponíveis no PC exceto o primeiro físico e o primeiro núcleo lógico, prevenindo assim os eventuais crashes.

### Instalação:
Caso esteja usando o STALKER Anomaly original ou qualquer mod que não altere sua estrutura de arquivos, basta extrair o arquivo `CPUFixAnomalyLauncher.exe` no diretório do jogo (mesmo diretório do arquivo `AnomalyLauncher.exe`) e carregar o jogo por meio deste novo launcher.

### Utilização:
Basta executar o launcher, uma janela de prompt será exibida com as informações do jogo aguardando o executável do Anomaly. Assim que o jogo for aberto, após alguns segundos, essa janela de comando se fechará automaticamente já que não existe mais utilidade para ela e a afinidade do jogo pelo primeiro núcleo físico e primeiro núcleo lógico estará desabilitado.

### Uso avançado:
Caso sejam necessários ajustes por conta de mods ou mesmo para executar o Anomaly pelo Mod Organizer, usuários mais avançados podem utilizar os argumentos de chamada do loader para trocar o launcher original do jogo (ou mesmo não utilizar nenhum launcher, nesse caso o script só fica esperando encontrar o processo do jogo), podem também setar mais núcleos retirados do jogo além do primeiro ou mesmo podem acessar uma tela de debug que mostra em tempo real (com atualização a cada 5 segundos) a utilização de CPU pelo jogo.

Para maiores informações a respeito dos argumentos de execução, basta executar o comando `CPUFixAnomalyLauncher.exe --help`.

### Código fonte e compilação:
[Repositório do GitHub](https://github.com/renard162/Anomaly_CPU_Fix_Launcher)

Dependências:
- [Python 3.12](https://www.python.org)
- [Psutil 7.0](https://pypi.org/project/psutil/)
- [PyInstaller 6.12](https://pypi.org/project/pyinstaller/)
