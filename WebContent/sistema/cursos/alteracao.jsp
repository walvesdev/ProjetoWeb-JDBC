<jsp:include page="/sistema/template/header.jsp" />
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
            <h3 class="tt_menu">&gt;&gt; CURSOS - ALTERAR UM CURSO &lt;&lt;</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <form class="form-horizontal" role="form" method="post" action="/ProjetoWeb/Controlador">
              <div class="form-group">
                <div class="col-sm-2">
                  <label for="inputCURSO" class="control-label">Informar o CURSO:</label>
                </div>
                <div class="col-sm-10">
                  <input type="number" name="cdcurso" class="form-control" id="inputCURSO" placeholder="Curso" required>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label for="inputNome" class="control-label">Informar o NOME:</label>
                </div>
                <div class="col-sm-10">
                  <input type="text" name="nome" class="form-control" id="inputNome" placeholder="Nome" required>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label for="inputVALOR" class="control-label">Informar o VALOR:</label>
                </div>
                <div class="col-sm-10">
                  <input type="number" name="valor" class="form-control" id="inputVALOR" placeholder="Valor" required>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label for="inputSITE" class="control-label">Informar o SITE:</label>
                </div>
                <div class="col-sm-10">
                  <input type="url" name="site" class="form-control" id="inputSITE" placeholder="Site" required>
                </div>
              </div>
              		<input type="hidden" name="idformulario" value="2">
						<input type="hidden" name="tipoformulario" value="24">
                  <button type="submit" class="btn btn-danger">Alterar</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center corrigir">
            <a class="btn btn-default" href="javascript:window.history.go(-1)">Voltar</a>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="/sistema/template/footer.jsp" />