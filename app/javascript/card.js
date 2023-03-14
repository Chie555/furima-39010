const pay = () => {
  const payjp = Payjp('')// PAY.JPテスト公開鍵
  const elements = payjp.elements();

  console.log("カード情報トークン化のためのJavaScript");
};

window.addEventListener("load", pay);