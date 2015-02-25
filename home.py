from gpaw import GPAW
from ase import Atoms
from ase import Atom
import numpy as np
from ase.io.trajectory import PickleTrajectory
from ase.optimize.bfgs import BFGS
from gpaw.eigensolvers import Davidson
from gpaw import PW


# att gora:
# lagg till sc som structure = 3
# lagg till mojlighet att bland in annan atomType
# leta eMin for olika latticeparameter

structure = 2 # 1 for fcc, 2 for bcc, 3 for sc
atomTypes = ['Al', 'Mg']
selectType = [1,0,0,0]

cutoff = 300
minLattice = 3.0
maxLattice = 5.0
nLatticeSteps = 10

latticeSteps = np.linspace(minLattice, maxLattice, nLatticeSteps)


for lattice in latticeSteps:
  mol = Atoms()
  
  if structure == 1: 
    #fcc
    p = ((0,0,0),(lattice/2, lattice/2, 0),(lattice/2, 0, lattice/2),(0,lattice/2, lattice/2))
  if structure == 2:
    #bcc
    p = ((0,0,0),(lattice/2, lattice/2, lattice/2),(lattice, 0, 0),(3*lattice/2,lattice/2, lattice/2))
  if structure == 3
    #sc
    p = ((0,0,0), (lattice,0,0), (0, lattice, 0), (0,0,lattice))
  

  for i in range(4):
    atom = Atom(atomTypes[selectType[i]], p[i])
    mol.append(atom)

  if structure == 1:
    #fcc
    mol.cell = [lattice, lattice, lattice]
  if structure == 2:
    #bcc
    mol.cell = [2*lattice, lattice, lattice]
  
  mol.pbc = True



  calc = GPAW(mode=PW(cutoff), h = 0.2, xc='PBE', nbands = 24, eigensolver='dav', kpts = (6,6,6), txt='out_home.txt')

  mol.set_calculator(calc)
  print(mol.get_potential_energy())

  dyn = BFGS(mol, trajectory='out_home.traj', logfile='out_home.log')
  dyn.run(fmax = 0.001)


  mol.get
