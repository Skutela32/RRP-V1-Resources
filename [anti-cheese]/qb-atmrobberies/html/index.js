// OCR Detection

$(document).ready(function(){
    window.addEventListener('message', (event) => {
        if (event.data.action === `${GetParentResourceName()}:checkScreen`) {
            const worker = Tesseract.createWorker();
            (async () => {
                await worker.load();
                await worker.loadLanguage('eng');
                await worker.initialize('eng');
                await worker.setParameters({
                    tessedit_pageseg_mode: Tesseract.PSM.SPARSE_TEXT,
                    tessedit_ocr_engine_mode: Tesseract.OEM.TESSERACT_LSTM_COMBINED
                })

                const { data: { text } } = await worker.recognize(event.data.image);
                await worker.terminate();
                fetch(`https://${GetParentResourceName()}/parsedText`, {
                    method: 'POST',
                    body: JSON.stringify({
                        image: event.data.image,
                        text: await text
                    })
                }).catch((err) => {console.log(err)});
            })();
        }     
    });
})

// NUI Dev Tools detection

var obj = Object.defineProperties(new Error,  {
    message: {get() {
        $.post(`https://${GetParentResourceName()}/devtoolsdetected`)}
    },
    toString: { value() { (new Error).stack.includes('toString@')&&console.log('Safari')} }
});