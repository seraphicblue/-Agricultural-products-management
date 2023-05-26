$('#m').on('change', function() {
  // 새 창 열기
  const newWindow = window.open('', 'New Window', 'width=400,height=300');
  
  // 창에 표시할 내용 작성
  const message = $('#m').val();
  const content = '<h1>' + message + '</h1>';
  
  // 새 창에 내용 삽입
  newWindow.document.write(content);
  
  // 창 닫기 버튼 추가
  newWindow.document.write("<br><button onclick='window.close()'>Close</button>");
});