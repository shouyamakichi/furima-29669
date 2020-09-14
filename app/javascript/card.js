const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");//form要素を取得する
  form.addEventListener("submit", (e) => {//submitというイベントが発火したら＝購入ボタンを押したら
    e.preventDefault();

    const formResult = document.getElementById("charge-form");//form要素を取得する
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchanse[number]"),
      // number: 42424242424
      cvc: formData.get("purchanse[cvc]"),
      // cvc: 123
      exp_month: formData.get("purchanse[exp_month]"),
      exp_year: `20${formData.get("purchanse[exp_year]")}`
    };
    
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");//form要素を取得する
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
  });
  };

window.addEventListener("load", pay);