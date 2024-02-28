import OpenAI from "openai";
import dotenv from "dotenv";
dotenv.config();

async function generate(prompt) {
  const openai = new OpenAI({
    apiKey: process.env.OPENAI_API_KEY || "",
    organization: process.env.OPENAI_ORG || "",
  });
  const completion = await openai.chat.completions.create({
    messages: [
      {
        role: "system",
        content:
          "You are a helpful assistant. Anwser the following questions, please.",
      },
      { role: "user", content: prompt },
    ],
    model: "gpt-3.5-turbo",
  });
  console.log(completion.choices[0].message.content ?? "Erro ao responder");
}

const prompt = process.argv[2];

generate(prompt);
