@echo off
chcp 65001 > nul
title YouTube Downloader
color 0A

echo ==========================================
echo    YOUTUBE VIDEO DOWNLOADER
echo ==========================================
echo.

REM Verificar Python
python --version > nul 2>&1
if %errorlevel% neq 0 (
    py --version > nul 2>&1
    if %errorlevel% neq 0 (
        echo ❌ Python não encontrado!
        echo.
        echo Instale Python em: https://python.org
        echo Ou pela Microsoft Store
        pause
        exit /b 1
    ) else (
        set PYTHON_CMD=py
    )
) else (
    set PYTHON_CMD=python
)

echo ✅ Python encontrado!

REM Verificar yt-dlp
%PYTHON_CMD% -c "import yt_dlp" > nul 2>&1
if %errorlevel% neq 0 (
    echo 📦 Instalando yt-dlp...
    %PYTHON_CMD% -m pip install yt-dlp
)

REM Criar pastas
if not exist "downloads" mkdir downloads
if not exist "downloads\videos" mkdir downloads\videos
if not exist "downloads\audio" mkdir downloads\audio

echo.
echo 🚀 Iniciando downloader...
echo.

REM Criar script Python corrigido
echo import yt_dlp > downloader.py
echo import os >> downloader.py
echo. >> downloader.py
echo def menu(): >> downloader.py
echo     while True: >> downloader.py
echo         print('\n=== YOUTUBE DOWNLOADER ===') >> downloader.py
echo         print('[1] Video completo') >> downloader.py
echo         print('[2] Apenas audio') >> downloader.py
echo         print('[3] Escolher qualidade') >> downloader.py
echo         print('[4] Sair') >> downloader.py
echo         opcao = input('\nOpcao: ').strip() >> downloader.py
echo. >> downloader.py
echo         if opcao == '1': >> downloader.py
echo             video_completo() >> downloader.py
echo         elif opcao == '2': >> downloader.py
echo             apenas_audio() >> downloader.py
echo         elif opcao == '3': >> downloader.py
echo             escolher_qualidade() >> downloader.py
echo         elif opcao == '4': >> downloader.py
echo             break >> downloader.py
echo         else: >> downloader.py
echo             print('Opcao invalida!') >> downloader.py
echo. >> downloader.py
echo def obter_info(link): >> downloader.py
echo     try: >> downloader.py
echo         with yt_dlp.YoutubeDL({'quiet': True}) as ydl: >> downloader.py
echo             return ydl.extract_info(link, download=False) >> downloader.py
echo     except Exception as e: >> downloader.py
echo         print(f'Erro: {e}') >> downloader.py
echo         return None >> downloader.py
echo. >> downloader.py
echo def mostrar_info(info): >> downloader.py
echo     print(f'\nTitulo: {info.get("title", "N/A")}') >> downloader.py
echo     print(f'Canal: {info.get("uploader", "N/A")}') >> downloader.py
echo     duration = info.get('duration', 0) >> downloader.py
echo     if duration: >> downloader.py
echo         mins, secs = divmod(duration, 60) >> downloader.py
echo         print(f'Duracao: {mins}:{secs:02d}') >> downloader.py
echo. >> downloader.py
echo def video_completo(): >> downloader.py
echo     link = input('\nLink: ').strip() >> downloader.py
echo     if not link: >> downloader.py
echo         return >> downloader.py
echo     print('\nAnalisando video...') >> downloader.py
echo     info = obter_info(link) >> downloader.py
echo     if not info: >> downloader.py
echo         return >> downloader.py
echo     mostrar_info(info) >> downloader.py
echo     if input('\nBaixar video? (s/n): ').lower() in ['s', 'sim']: >> downloader.py
echo         try: >> downloader.py
echo             opts = { >> downloader.py
echo                 'format': 'best[ext=mp4]/best', >> downloader.py
echo                 'outtmpl': 'downloads/videos/%%(title)s.%%(ext)s' >> downloader.py
echo             } >> downloader.py
echo             os.makedirs('downloads/videos', exist_ok=True) >> downloader.py
echo             with yt_dlp.YoutubeDL(opts) as ydl: >> downloader.py
echo                 print('\nBaixando video...') >> downloader.py
echo                 ydl.download([link]) >> downloader.py
echo                 print('✅ Video baixado em: downloads/videos/') >> downloader.py
echo         except Exception as e: >> downloader.py
echo             print(f'Erro no download: {e}') >> downloader.py
echo. >> downloader.py
echo def apenas_audio(): >> downloader.py
echo     link = input('\nLink: ').strip() >> downloader.py
echo     if not link: >> downloader.py
echo         return >> downloader.py
echo     print('\nAnalisando video...') >> downloader.py
echo     info = obter_info(link) >> downloader.py
echo     if not info: >> downloader.py
echo         return >> downloader.py
echo     mostrar_info(info) >> downloader.py
echo     if input('\nBaixar audio? (s/n): ').lower() in ['s', 'sim']: >> downloader.py
echo         try: >> downloader.py
echo             opts = { >> downloader.py
echo                 'format': 'bestaudio[ext=m4a]/bestaudio', >> downloader.py
echo                 'outtmpl': 'downloads/audio/%%(title)s.%%(ext)s' >> downloader.py
echo             } >> downloader.py
echo             os.makedirs('downloads/audio', exist_ok=True) >> downloader.py
echo             with yt_dlp.YoutubeDL(opts) as ydl: >> downloader.py
echo                 print('\nBaixando audio...') >> downloader.py
echo                 ydl.download([link]) >> downloader.py
echo                 print('✅ Audio baixado em: downloads/audio/') >> downloader.py
echo         except Exception as e: >> downloader.py
echo             print(f'Erro no download: {e}') >> downloader.py
echo. >> downloader.py
echo def escolher_qualidade(): >> downloader.py
echo     link = input('\nLink: ').strip() >> downloader.py
echo     if not link: >> downloader.py
echo         return >> downloader.py
echo     print('\nAnalisando formatos...') >> downloader.py
echo     try: >> downloader.py
echo         with yt_dlp.YoutubeDL({'quiet': True}) as ydl: >> downloader.py
echo             info = ydl.extract_info(link, download=False) >> downloader.py
echo         mostrar_info(info) >> downloader.py
echo         formats = info.get('formats', []) >> downloader.py
echo         video_formats = [] >> downloader.py
echo         for f in formats: >> downloader.py
echo             if f.get('vcodec') != 'none' and f.get('height'): >> downloader.py
echo                 video_formats.append(f) >> downloader.py
echo         if not video_formats: >> downloader.py
echo             print('Nenhum formato de video encontrado') >> downloader.py
echo             return >> downloader.py
echo         print('\nQualidades disponiveis:') >> downloader.py
echo         unique = {} >> downloader.py
echo         for f in video_formats: >> downloader.py
echo             height = f.get('height') >> downloader.py
echo             ext = f.get('ext', 'mp4') >> downloader.py
echo             key = f'{height}p_{ext}' >> downloader.py
echo             if key not in unique: >> downloader.py
echo                 unique[key] = f >> downloader.py
echo         sorted_formats = sorted(unique.values(), key=lambda x: x.get('height', 0), reverse=True) >> downloader.py
echo         for i, f in enumerate(sorted_formats, 1): >> downloader.py
echo             height = f.get('height', 0) >> downloader.py
echo             ext = f.get('ext', 'mp4') >> downloader.py
echo             fps = f.get('fps', 0) >> downloader.py
echo             fps_str = f' {int(fps)}fps' if fps else '' >> downloader.py
echo             print(f'[{i}] {height}p {ext.upper()}{fps_str}') >> downloader.py
echo         try: >> downloader.py
echo             escolha = int(input(f'\nEscolha (1-{len(sorted_formats)}): ')) - 1 >> downloader.py
echo             if 0 ^<= escolha ^< len(sorted_formats): >> downloader.py
echo                 format_selected = sorted_formats[escolha] >> downloader.py
echo                 format_id = format_selected['format_id'] >> downloader.py
echo                 if input('Baixar? (s/n): ').lower() in ['s', 'sim']: >> downloader.py
echo                     opts = { >> downloader.py
echo                         'format': format_id, >> downloader.py
echo                         'outtmpl': 'downloads/videos/%%(title)s.%%(ext)s' >> downloader.py
echo                     } >> downloader.py
echo                     os.makedirs('downloads/videos', exist_ok=True) >> downloader.py
echo                     with yt_dlp.YoutubeDL(opts) as ydl: >> downloader.py
echo                         print('\nBaixando...') >> downloader.py
echo                         ydl.download([link]) >> downloader.py
echo                         print('✅ Video baixado em: downloads/videos/') >> downloader.py
echo             else: >> downloader.py
echo                 print('Opcao invalida') >> downloader.py
echo         except ValueError: >> downloader.py
echo             print('Digite um numero valido') >> downloader.py
echo     except Exception as e: >> downloader.py
echo         print(f'Erro: {e}') >> downloader.py
echo. >> downloader.py
echo if __name__ == '__main__': >> downloader.py
echo     try: >> downloader.py
echo         menu() >> downloader.py
echo     except KeyboardInterrupt: >> downloader.py
echo         print('\nPrograma encerrado pelo usuario') >> downloader.py
echo     except Exception as e: >> downloader.py
echo         print(f'Erro inesperado: {e}') >> downloader.py

%PYTHON_CMD% downloader.py

REM Limpar
del downloader.py > nul 2>&1

echo.
echo Pressione qualquer tecla para fechar...
pause > nul