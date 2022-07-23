let web3, contract, user, usersNfts, sex, signature;
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
      contract =  await new web3.eth.Contract(abi.senzai, contractAddr);
      //await sign();
      $(".welcome").hide();
      $(".connect").hide();
      $("div.inputbody").fadeIn();
    }
  } catch (error){
    alert(error.message);
  }
})

const sign = async () => {
  try {
    signature = await web3.eth.personal.sign($('#signrand').val(), user);
    $(".inputsign").val(signature);
  }catch(error){
    alert(error.message);
    location.reload();
  }
}

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
      if (switchError.code === 4902) {
        alert('add this chain id');
      }
      return false;
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
    $('.box').fadeIn();
    $('#nftname').html("SENZAI #"+val);
    fetch("/senzai/metadata/"+val)
    .then(response => {
      return response.json();
    })
    .then(jsondata => {
      sex = jsondata.attributes[1].value.slice(0, 3);
      $(".inputsex").val(sex);
      $('.cloths.'+sex).fadeIn();
    });
    $(".preview.img_01").attr('src', "assets/origin/origin-"+val+".png");
  } else {
    alert("This NFT's owner is not you");
    location.reload();
  }
})

$('.cloth').on('click', function(){
  let val = $(this).data('id');
  $(".cloth").removeClass("border border-white");
  $(this).addClass("border border-white");
  path = sex == "Men" ? "clothesMale" : "clothesFemale"
  $(".preview.img_02").fadeIn();
  $('.inputcloth').val(val);
  $(".preview.img_02").attr('src', `assets/${path}/${val}`);
  $('.kettei').fadeIn();
})

$('.kettei').on('click', async function(){
  await submitdress();
})

async function submitdress(){
  await sign();
  document.dressForm.action="dress";
	document.dressForm.method="POST";
	document.dressForm.submit();
}

const moons = ['👔', '👕', '👖', '👗', '👘', '🥻', '👙', '👓', '🧥'];
let count = 0;
setInterval(()=> {
  hashtext = ""
  for (i=0;i<50;i++){
    hashtext += moons[count % moons.length];
  }
	location.hash = hashtext;
	count++;
}, 275);