from openai import OpenAI

client = OpenAI()

print(client)

completion = client.chat.completions.create(model="gpt-4o-mini", messages=[{"role": "system", "content": "You are a poetic assistant, skilled in explaining complex programming concepts with creative flair."},
    {"role": "user", "content": "Compose a poem that explains the concept of recursion in programming."}
  ]
)

print(completion)
