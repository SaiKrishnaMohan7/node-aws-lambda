# 🧪 AWS Lambda Dev Environment (TypeScript → ZIP → Local Sim)

This repo provides a reliable, fast-feedback dev environment for AWS Lambda functions written in **TypeScript**, packaged as **zip deployments**, and run **locally using AWS SAM**.

The goal is to simulate **exactly what AWS Lambda does**, so you can:

- 💥 Catch errors before deploying
- 🧠 Build with confidence
- 🔁 Iterate quickly without pushing code to AWS
- 🧰 Equip your team with a dev setup that just works

---

## 🚀 Quick Start

```bash
npm install
npm run dev
````

That will:

1. Compile `src/main.ts` → `dist/main.js`
2. Create a deployable `lambda.zip` (same format AWS expects)
3. Unzip it into a temp dir
4. Run the Lambda **locally** with the real Node.js 18 runtime via SAM

---

## 📁 Project Structure

```shell
.
├── src/                # Your TypeScript Lambda handler
│   └── main.ts
├── dist/               # Compiled JS output (gitignored)
├── lambda.zip          # Simulated Lambda zip file (gitignored)
├── event.json          # Sample Lambda event
├── tsconfig.json       # TypeScript config
├── template.yaml       # SAM template for ZIP-based Lambda
├── .sam/unzipped/      # Simulated AWS unzip dir (gitignored)
```

---

## 🛠 Scripts

| Script           | What it does                                          |
| ---------------- | ----------------------------------------------------- |
| `npm run build`  | Compiles `src/main.ts` → `dist/main.js`               |
| `npm run zip`    | Zips `dist/main.js` + `package.json` → `lambda.zip`   |
| `npm run invoke` | Unzips the zip & invokes it locally with `event.json` |
| `npm run dev`    | Cleans, builds, zips, and invokes in one shot         |

---

## 📦 Requirements

* Node.js 18+
* [AWS SAM CLI](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-sam-cli.html)
* Docker (required by `sam local invoke`)

---

## 🧪 Sample Event

Edit `event.json` to test different inputs:

```json
{
  "input": "Hello from local test"
}
```

---

## 🤝 Contributing

This setup was built to simplify the lives of engineers working on Lambda functions. Feel free to fork, PR, or use it internally to streamline your dev process.

---

## 🧠 Why This Exists

AWS Lambda development is painful when:

* You don't know if your zip will work
* The `handler` export is misconfigured
* ESM/CommonJS module errors blow up silently
* Deployment takes 5+ minutes per test

This repo eliminates all of that by mimicking **exactly what AWS does** locally.

---

> 🧘 Work with peace of mind: if it runs here, it will run in Lambda.
