var mod = angular.module("jogo_da_vida_app", []);

mod.controller("GameController", function($scope, $interval){
	var n = 50;

	$scope.generations = 0;
	$scope.started = false;
	$scope.matrix = new Array(n);
	var i;
	for (i = 0; i < n; i++) {
		$scope.matrix[i] = new Array(n);
	}

	var u = undefined;

	var minimal = [
			[u, 1, u], 
			[u, u, 1], 
			[1 ,1, 1]
		];

	var accorn = [
			[u, 1, u, u, u, u, u], 
			[u, u, u, 1, u, u, u], 
			[1 ,1, u, u, 1, 1, 1]
		];

		
	var applyPattern = function (pattern, x, y){
		for (var linha = 0; linha < pattern.length; linha++) {
			for (var coluna = 0; coluna < pattern[linha].length; coluna++) {
				$scope.matrix[linha + y][coluna + x] = pattern[linha][coluna];
			}
		}
	};

	// applyPattern(minimal, 0, 0);
	// applyPattern(accorn, 20, 20);


	$scope.muda = function(){
		var matrix_new = new Array(n);

		for (var i = 0; i < n; i++) {
			matrix_new[i] = new Array(n);
			for (var j = 0; j < n; j++) {
				var count = contaVizinhos(i, j);
				var current_is_true = $scope.matrix[i][j];
				
				// PROCRIA OU VIVE
				if(count == 3){
					matrix_new[i][j] = true;
				}
				else if(count == 2 && current_is_true){
					matrix_new[i][j] = true;
				}
				// DIE MOTHER FUCKER
				else if($scope.matrix[i][j] !== undefined){
					matrix_new[i][j] = false;
				}
			}
		}

		$scope.matrix = matrix_new;

	};

	$scope.getLives = function(status){
		if($scope.started){
			var counter = 0;
			for (var linha = 0; linha < $scope.matrix.length; linha++) {
				for (var coluna = 0; coluna < $scope.matrix[linha].length; coluna++) {
						if($scope.matrix[linha][coluna] == status)
							counter++;
				}
			}
			return counter;
		}
	};

	var contaVizinhos = function(i, j) {
		var count = 0;
		var i0 = i-1 > 0 ? i-1 : 0;
		var j0 = j-1 > 0 ? j-1 : 0;
		
		var imax = i+1 > n-1 ? n-1:i+1;
		var jmax = j+1 > n-1 ? n-1:j+1;

		for (var k = i0; k <= imax; k++)
			for (var kk = j0; kk <= jmax; kk++ ){
				if (k == i && kk == j)
					continue;
				if (!!$scope.matrix[k][kk])
					count++;
			}
		return count;
	};

	$scope.start = function (){
		$scope.started = true;
		$interval(function(){
			$scope.muda();
			$scope.generations++;
		}, 50);
	};

	$scope.change = function(item){
		item = !item;
		console.log($scope.matrix);
	}

	var gd;
	$scope.getLine = function(index){
		$scope.matrix[index][gd] = $scope.matrix[index][gd]?undefined:true;
	}

	$scope.getColumn = function(index){
		gd=index;
	}
	// 2 ou 3 vizinhos vivos -> vive
	// 3 -> nasce
	// <= 1 && >=4 -> morre

});

