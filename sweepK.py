from gpaw import GPAW
from ase import Atoms
from ase import Atom
import numpy as np
from ase.io.trajectory import PickleTrajectory
from ase.optimize.bfgs import BFGS
from gpaw.eigensolvers import Davidson
from gpaw import PW



structure = 1 # 1 for fcc, 2 for bcc, 3 for sc
atomTypes = ['Al', 'Mg']
selectType = [0,0,0,0]

lattice = 4
cutoff = 300
minK = 2
maxK = 10
nKSteps = 5

kSteps = np.linspace(minK, maxK, nKSteps)

for k in kSteps:
  mol = Atoms()
  
  if structure == 1: 
    #fcc
    p = ((0,0,0),(lattice/2, lattice/2, 0),(lattice/2, 0, lattice/2),(0,lattice/2, lattice/2))
  if structure == 2:
    #bcc
    p = ((0,0,0),(lattice/2, lattice/2, lattice/2),(lattice, 0, 0),(3*lattice/2,lattice/2, lattice/2))
  if structure == 3:
    #sc
    p = ((0,0,0), (lattice,0,0), (2*lattice, 0, 0), (3*lattice,0,0))
  

  for i in range(4):
    atom = Atom(atomTypes[selectType[i]], p[i])
    mol.append(atom)

  if structure == 1:
    #fcc
    mol.cell = [lattice, lattice, lattice]
  if structure == 2:
    #bcc
    mol.cell = [2*lattice, lattice, lattice]
  if structure == 3:
    #sc
    mol.cell = [4*lattice, lattice, lattice]
  
  mol.pbc = True



  calc = GPAW(mode=PW(cutoff), h = 0.2, xc='PBE', nbands = 24, eigensolver='dav', kpts = (int(k),int(k),int(k)), txt='out_home.txt')

  mol.set_calculator(calc)
  energy = mol.get_potential_energy()
  print(str(k) + '\t' + str(energy))

