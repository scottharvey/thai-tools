class TT.Characters

  allCharacters: []

  constructor: ->
    $.each @all, (index, attrs) =>
      @allCharacters.push attrs["character"]

  randomCharacter: =>
    @allCharacters[Math.floor(Math.random() * @allCharacters.length)]

  all: [
    {
      "character":"-",
      "keyCode":192,
      "shift":false
    },
    {
      "character":"ๅ",
      "keyCode":49,
      "shift":false
    },
    {
      "character":"/",
      "keyCode":50,
      "shift":false
    },
    {
      "character":"_",
      "keyCode":51,
      "shift":false
    },
    {
      "character":"ภ",
      "keyCode":52,
      "shift":false
    },
    {
      "character":"ถ",
      "keyCode":53,
      "shift":false
    },
    {
      "character":"ุ",
      "keyCode":54,
      "shift":false
    },
    {
      "character":"ึ",
      "keyCode":55,
      "shift":false
    },
    {
      "character":"ค",
      "keyCode":56,
      "shift":false
    },
    {
      "character":"ต",
      "keyCode":57,
      "shift":false
    },
    {
      "character":"จ",
      "keyCode":48,
      "shift":false
    },
    {
      "character":"ข",
      "keyCode":189,
      "shift":false
    },
    {
      "character":"ช",
      "keyCode":187,
      "shift":false
    },
    {
      "character":"ๆ",
      "keyCode":81,
      "shift":false
    },
    {
      "character":"ไ",
      "keyCode":87,
      "shift":false
    },
    {
      "character":"ำ",
      "keyCode":69,
      "shift":false
    },
    {
      "character":"พ",
      "keyCode":82,
      "shift":false
    },
    {
      "character":"ะ",
      "keyCode":84,
      "shift":false
    },
    {
      "character":"ั",
      "keyCode":89,
      "shift":false
    },
    {
      "character":"ี",
      "keyCode":85,
      "shift":false
    },
    {
      "character":"ร",
      "keyCode":73,
      "shift":false
    },
    {
      "character":"น",
      "keyCode":79,
      "shift":false
    },
    {
      "character":"ย",
      "keyCode":80,
      "shift":false
    },
    {
      "character":"บ",
      "keyCode":219,
      "shift":false
    },
    {
      "character":"ล",
      "keyCode":221,
      "shift":false
    },
    {
      "character":"ฃ",
      "keyCode":220,
      "shift":false
    },
    {
      "character":"ฟ",
      "keyCode":65,
      "shift":false
    },
    {
      "character":"ห",
      "keyCode":83,
      "shift":false
    },
    {
      "character":"ก",
      "keyCode":68,
      "shift":false
    },
    {
      "character":"ด",
      "keyCode":70,
      "shift":false
    },
    {
      "character":"เ",
      "keyCode":71,
      "shift":false
    },
    {
      "character":"้",
      "keyCode":72,
      "shift":false
    },
    {
      "character":"่",
      "keyCode":74,
      "shift":false
    },
    {
      "character":"า",
      "keyCode":75,
      "shift":false
    },
    {
      "character":"ส",
      "keyCode":76,
      "shift":false
    },
    {
      "character":"ว",
      "keyCode":186,
      "shift":false
    },
    {
      "character":"ง",
      "keyCode":222,
      "shift":false
    },
    {
      "character":"ผ",
      "keyCode":90,
      "shift":false
    },
    {
      "character":"ป",
      "keyCode":88,
      "shift":false
    },
    {
      "character":"แ",
      "keyCode":67,
      "shift":false
    },
    {
      "character":"อ",
      "keyCode":86,
      "shift":false
    },
    {
      "character":"ิ",
      "keyCode":66,
      "shift":false
    },
    {
      "character":"ื",
      "keyCode":78,
      "shift":false
    },
    {
      "character":"ท",
      "keyCode":77,
      "shift":false
    },
    {
      "character":"ม",
      "keyCode":188,
      "shift":false
    },
    {
      "character":"ใ",
      "keyCode":190,
      "shift":false
    },
    {
      "character":"ฝ",
      "keyCode":191,
      "shift":false
    },
    {
      "character":"%",
      "keyCode":192,
      "shift":true
    },
    {
      "character":"+",
      "keyCode":49,
      "shift":true
    },
    {
      "character":"๑",
      "keyCode":50,
      "shift":true
    },
    {
      "character":"๒",
      "keyCode":51,
      "shift":true
    },
    {
      "character":"๓",
      "keyCode":52,
      "shift":true
    },
    {
      "character":"๔",
      "keyCode":53,
      "shift":true
    },
    {
      "character":"ู",
      "keyCode":54,
      "shift":true
    },
    {
      "character":"฿",
      "keyCode":55,
      "shift":true
    },
    {
      "character":"๕",
      "keyCode":56,
      "shift":true
    },
    {
      "character":"๖",
      "keyCode":57,
      "shift":true
    },
    {
      "character":"๗",
      "keyCode":48,
      "shift":true
    },
    {
      "character":"๘",
      "keyCode":189,
      "shift":true
    },
    {
      "character":"๙",
      "keyCode":187,
      "shift":true
    },
    {
      "character":"๐",
      "keyCode":81,
      "shift":true
    },
    {
      "character":"”",
      "keyCode":87,
      "shift":true
    },
    {
      "character":"ฎ",
      "keyCode":69,
      "shift":true
    },
    {
      "character":"ฑ",
      "keyCode":82,
      "shift":true
    },
    {
      "character":"ธ",
      "keyCode":84,
      "shift":true
    },
    {
      "character":"ํ",
      "keyCode":89,
      "shift":true
    },
    {
      "character":"๊",
      "keyCode":85,
      "shift":true
    },
    {
      "character":"ณ",
      "keyCode":73,
      "shift":true
    },
    {
      "character":"ฯ",
      "keyCode":79,
      "shift":true
    },
    {
      "character":"ญ",
      "keyCode":80,
      "shift":true
    },
    {
      "character":"ฐ",
      "keyCode":219,
      "shift":true
    },
    {
      "character":",",
      "keyCode":221,
      "shift":true
    },
    {
      "character":"ฅ",
      "keyCode":220,
      "shift":true
    },
    {
      "character":"ฤ",
      "keyCode":65,
      "shift":true
    },
    {
      "character":"ฆ",
      "keyCode":83,
      "shift":true
    },
    {
      "character":"ฏ",
      "keyCode":68,
      "shift":true
    },
    {
      "character":"โ",
      "keyCode":70,
      "shift":true
    },
    {
      "character":"ฌ",
      "keyCode":71,
      "shift":true
    },
    {
      "character":"็",
      "keyCode":72,
      "shift":true
    },
    {
      "character":"๋",
      "keyCode":74,
      "shift":true
    },
    {
      "character":"ษ",
      "keyCode":75,
      "shift":true
    },
    {
      "character":"ศ",
      "keyCode":76,
      "shift":true
    },
    {
      "character":"ซ",
      "keyCode":186,
      "shift":true
    },
    {
      "character":".",
      "keyCode":222,
      "shift":true
    },
    {
      "character":"(",
      "keyCode":90,
      "shift":true
    },
    {
      "character":")",
      "keyCode":88,
      "shift":true
    },
    {
      "character":"ฉ",
      "keyCode":67,
      "shift":true
    },
    {
      "character":"ฮ",
      "keyCode":86,
      "shift":true
    },
    {
      "character":"ฺ",
      "keyCode":66,
      "shift":true
    },
    {
      "character":"์",
      "keyCode":78,
      "shift":true
    },
    {
      "character":"?",
      "keyCode":77,
      "shift":true
    },
    {
      "character":"ฒ",
      "keyCode":188,
      "shift":true
    },
    {
      "character":"ฬ",
      "keyCode":190,
      "shift":true
    },
    {
      "character":"ฦ",
      "keyCode":191,
      "shift":true
    }
  ]

  # keys=["`", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "=", "q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "[", "]", "\", "a", "s", "d", "f", "g", "h", "j", "k", "l", ";", "'", "z", "x", "c", "v", "b", "n", "m", ",", ".", "/"]
  # codes=[192, 49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 189, 187, 81, 87, 69, 82, 84, 89, 85, 73, 79, 80, 219, 221, 220, 65, 83, 68, 70, 71, 72, 74, 75, 76, 186, 222, 90, 88, 67, 86, 66, 78, 77, 188, 190, 191];
  # withoutShift = ["-", "ๅ", "/", "_", "ภ", "ถ", "ุ", "ึ", "ค", "ต", "จ", "ข", "ช", "ๆ", "ไ", "ำ", "พ", "ะ", "ั", "ี", "ร", "น", "ย", "บ", "ล", "ฃ", "ฟ", "ห", "ก", "ด", "เ", "้", "่", "า", "ส", "ว", "ง", "ผ", "ป", "แ", "อ", "ิ", "ื", "ท", "ม", "ใ", "ฝ"];
  # withShift = ["%", "+", "๑", "๒", "๓", "๔", "ู", "฿", "๕", "๖", "๗", "๘", "๙", "๐", '”', "ฎ", "ฑ", "ธ", "ํ", "๊", "ณ", "ฯ", "ญ", "ฐ", ",", "ฅ", "ฤ", "ฆ", "ฏ", "โ", "ฌ", "็", "๋", "ษ", "ศ", "ซ", ".", "(", ")", "ฉ", "ฮ", "ฺ", "์", "?", "ฒ", "ฬ", "ฦ"];
