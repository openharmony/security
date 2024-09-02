export default function generateRandomString(): string {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    const charactersLength = characters.length;

  for (let i = 0; i < 6; i++) {
    const randomIndex: number = Math.floor(Math.random() * charactersLength);
    result += characters.charAt(randomIndex);  // 使用 charAt 方法
  }
    return `flag{${result}}`;
  }

