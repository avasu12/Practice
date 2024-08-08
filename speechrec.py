import speech_recognition as sr

def transcribe_audio(file_path):
    recognizer = sr.Recognizer()
    with sr.AudioFile(file_path) as source:
        audio_data = recognizer.record(source)
        text = recognizer.recognize_google(audio_data)
        print("Transcript: " + text)

# Call the function with your audio file path
transcribe_audio("/Users/jhgf/testrecording.mp4")

