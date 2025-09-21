# YouTube Downloader

Um downloader simples e eficiente para vídeos do YouTube, construído com Python e yt-dlp. Este script permite baixar vídeos em diferentes qualidades ou apenas o áudio dos vídeos.

## ✨ Características

- **Interface amigável**: Menu interativo em português
- **Múltiplas opções de download**:
  - Vídeo completo (melhor qualidade disponível)
  - Apenas áudio (formato M4A)
  - Seleção personalizada de qualidade
- **Auto-instalação**: Instala automaticamente as dependências necessárias
- **Organização automática**: Cria pastas separadas para vídeos e áudios
- **Informações do vídeo**: Mostra título, canal e duração antes do download

## 🚀 Como usar

### Pré-requisitos

- **Python 3.6+** instalado no sistema
  - Download: [python.org](https://python.org)
  - Ou instale pela Microsoft Store

### Instalação e Execução

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/kasamex/youtube-downloader.git
   cd youtube-downloader
   ```

2. **Execute o script**:
   - **Windows**: Clique duas vezes em `youtube-downloader.bat`
   - **Ou via linha de comando**:
     ```cmd
     youtube-downloader.bat
     ```

3. **Siga as instruções na tela**:
   - Cole o link do vídeo do YouTube
   - Escolha o tipo de download desejado
   - Aguarde o processo concluir

## 📁 Estrutura de Pastas

Após a execução, o programa criará automaticamente:

```
downloads/
├── videos/     # Vídeos baixados
└── audio/      # Áudios extraídos
```

## 🎯 Opções de Download

### 1. Vídeo Completo
- Baixa o vídeo na melhor qualidade disponível
- Formato: MP4 (quando possível)
- Salvo em: `downloads/videos/`

### 2. Apenas Áudio
- Extrai apenas o áudio do vídeo
- Formato: M4A (alta qualidade)
- Salvo em: `downloads/audio/`

### 3. Escolher Qualidade
- Lista todas as qualidades disponíveis
- Permite seleção manual (720p, 1080p, 4K, etc.)
- Mostra informações de FPS quando disponível

## 🛠️ Tecnologias Utilizadas

- **Python**: Linguagem principal
- **yt-dlp**: Biblioteca para download de vídeos
- **Batch Script**: Interface Windows

## 📝 Exemplo de Uso

```
=== YOUTUBE DOWNLOADER ===
[1] Video completo
[2] Apenas audio
[3] Escolher qualidade
[4] Sair

Opcao: 1

Link: https://youtube.com/watch?v=exemplo

Analisando video...
Titulo: Exemplo de Vídeo
Canal: Canal Exemplo
Duracao: 3:45

Baixar video? (s/n): s
Baixando video...
✅ Video baixado em: downloads/videos/
```

## ⚙️ Funcionalidades Técnicas

- **Verificação automática do Python**: Suporta ambos `python` e `py`
- **Instalação automática de dependências**: Instala `yt-dlp` se necessário
- **Tratamento de erros**: Mensagens informativas para problemas comuns
- **Codificação UTF-8**: Suporte completo a caracteres especiais
- **Limpeza automática**: Remove arquivos temporários após execução

## 🐛 Solução de Problemas

### Python não encontrado
- Instale Python de [python.org](https://python.org)
- Ou use a Microsoft Store
- Certifique-se de marcar "Add to PATH" durante a instalação

### Erro de download
- Verifique se o link está correto
- Alguns vídeos podem ter restrições geográficas
- Vídeos privados não podem ser baixados

### Problemas de permissão
- Execute como administrador se necessário
- Verifique se tem espaço suficiente no disco

## 📜 Licença

Este projeto é licenciado sob a MIT License - veja o arquivo [LICENSE](LICENSE) para detalhes.

## ⚠️ Aviso Legal

Este software é fornecido apenas para fins educacionais e de uso pessoal. Respeite os direitos autorais e os termos de serviço do YouTube. O uso deste software é de sua inteira responsabilidade.

## 📧 Suporte

Se encontrar algum problema ou tiver dúvidas, abra uma [issue](https://github.com/kasamex/youtube-downloader/issues) no GitHub.

---

**Desenvolvido com ❤️ para a comunidade**
