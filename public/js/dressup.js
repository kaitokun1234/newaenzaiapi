let web3, contract, user, usersNfts, sex;
const contractAddr = "0x9c8230d31f9f513901685f91fa18b3c038118a1e";

$(document).ready(async () => {
  web3 = await new Web3(Web3.givenProvider);
  switchNetwork(1);
  contract =  await new web3.eth.Contract(abi.senzai, contractAddr);
})

$(".connect").click(async () => {
  try{
    const accounts = await window.ethereum.request({
      method: "eth_requestAccounts",
    });
    user = accounts[0];
    if(await switchNetwork(1)){
      web3 = await new Web3(Web3.givenProvider);
      $(".connect").hide();
      contract =  await new web3.eth.Contract(abi.senzai, contractAddr);
      $("div.inputbody").show();
      window.sessionStorage.setItem(['user'],[user]);
    }
  } catch (error){
    alert(error.message);
  }
})

const switchNetwork = async (chainId) => {
  const currentChainId = await web3.eth.net.getId();
  if (currentChainId !== chainId) {
    try {
      await web3.currentProvider.request({
        method: 'wallet_switchEthereumChain',
          params: [{ chainId: Web3.utils.toHex(chainId) }],
        });
      return true;
    } catch (switchError) {
      return false;
      if (switchError.code === 4902) {
        alert('add this chain id');
      }
    }
  }else{
    return true;
  }
}

$(".ok").on('click', async function(){
  let val = $('input.inputbody').val();
  let owner = await contract.methods.ownerOf(val).call();

  if(owner.toUpperCase() == user.toUpperCase()){
    $("div.inputbody").hide();
    $('.box').show();
    fetch("/senzai/metadata/"+val)
    .then(response => {
      return response.json();
    })
    .then(jsondata => {
      sex = jsondata.attributes[1].value.slice(0, 3);
      $(".inputsex").val(sex);
      $("ul").show();
      //$('.cloths.'+sex).show();
    });
    $(".preview.img_01").attr('src', "assets/origin/origin-"+val+".png");
  } else {
    alert("This NFT's owner is not you");
    location.reload();
  }
})

$('.cloth').on('click', function(){
  let val = $(this).data('id');
  path = sex == "Men" ? "clothesMale" : "clothesFemale"
  $(".preview.img_02").show();
  $('.inputcloth').val(val);
  $(".preview.img_02").attr('src', `assets/${path}/${val}`);
  $('.kettei').show();
})