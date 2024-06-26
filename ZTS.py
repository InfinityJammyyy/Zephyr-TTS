import subprocess
import os
import ollama

def play_audio(file_path):
    subprocess.run(["mplayer", file_path])

def generate_speech(text, out_path):
    subprocess.run([
        "sudo",
        "tts",
        "--text", text,
        "--model_name", "tts_models/en/ljspeech/fast_pitch",
        "--vocoder_name", "vocoder_models/en/ljspeech/hifigan_v2",
        "--out_path", out_path
    ])

def process_input():
    multi_sentence_mode = False
    user_input = ""

    while True:
        subprocess.run(["sudo", "echo"]) 

        if not multi_sentence_mode:
            user_input = input("Chat here to stablelm's zephyr:\n\n")
            if user_input.lower() == 'multi':
                multi_sentence_mode = True
                user_input = ""
        else:
            print("Enter your sentences (type 'stop' to finish):\n")
            while True:
                sentence = input()
                if sentence.lower() == "stop":
                    multi_sentence_mode = False
                    print("\nStopping multi mode\n")
                    break
                user_input += sentence + " "

        if user_input.strip():
            print("\nSubmitting to Zephyr")
            ollama_output = ollama.chat(model='stablelm-zephyr', messages=[{'role': 'user', 'content': user_input}])['message']['content']
            out_path = os.path.expanduser("~/LLM-TTS/speech.wav")
            generate_speech(ollama_output, out_path)

            while True:
                input("\nPress Enter to hear the response...\n")
                play_audio(out_path)
                repeat_input = input("Would you like me to repeat that (say 'yes' to re-play the audio, press Enter to chat with Zephyr again):\n").strip().lower()
                if repeat_input != 'yes':
                    break

if __name__ == "__main__":
    try:
        process_input()
    except (KeyboardInterrupt, EOFError):
        print("\nClosing the program. Have a nice day!!\n")
