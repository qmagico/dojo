var mod = angular.module("GameOfLifeApp", []);

mod.controller("GameController", function($scope, $interval){
	var n = 50;
	$scope.matrix = new Array(n)
	var i;
	for (i = 0; i < n; i++) {
		$scope.matrix[i] = new Array(n);
	}


	$scope.changeState = function(i, j){
		$scope.matrix[i][j] = !$scope.matrix[i][j];
	}

	var x = 20;
	var y = 40;

	$scope.changeState(1 + x,2 + y);
	$scope.changeState(2 + x,4 + y);
	$scope.changeState(3 + x,1 + y);
	$scope.changeState(3 + x,2 + y);
	$scope.changeState(3 + x,5 + y);
	$scope.changeState(3 + x,6 + y);
	$scope.changeState(3 + x,7 + y);

	$scope.muda = function(){
		var matrix_new = new Array(n);

		for (var i = 0; i < n; i++) {
				console.log('\n');
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
				else if(count > 0 || $scope.matrix[i][j] == false){
					matrix_new[i][j] = false;
				}
			}
		}

		$scope.matrix = matrix_new;

	};

	var contaVizinhos = function(i, j) {
		var count = 0;
		var i0 = i-1 > 0 ? i-1 : 0;
		var j0 = j-1 > 0 ? j-1 : 0;
		
		var imax;
		var jmax;
		
		if (i + 1 > n-1) 
			imax = n - 1;
		else
			imax = i + 1;

		if (j + 1 > n-1) 
			jmax = n - 1;
		else
			jmax = j + 1;


		for (var k = i0; k <= imax; k++)
			for (var kk = j0; kk <= jmax; kk++ ){
				if (k == i && kk == j)
					continue;
				if (!!$scope.matrix[k][kk])
					count++;
			}
		return count;
	};

	$interval(function(){
		$scope.muda();
	}, 50);

	// 2 ou 3 vizinhos vivos -> vive
	// 3 -> nasce
	// <= 1 && >=4 -> morre

});

